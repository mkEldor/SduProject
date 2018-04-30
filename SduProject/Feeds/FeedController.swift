//
//  FeedController.swift
//  SduProject
//
//  Created by Eldor Makkambaev on 30.04.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import UIKit

let feed_id = "feed_cell"

class Post{
    var name: String?
    var profileImageName: String = "sdu_logo"
    var statusText: String?
    var statusImageName: String?
    var numLikes: Int?
    var numComments: Int?
}

class FeedController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.tabBarItem.image = UIImage(named: "newspaper")
        
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: feed_id)
        
        getFeeds()
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feed_id, for: indexPath) as! FeedCell
        cell.post = posts[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let statusText = posts[indexPath.row].statusText{
            let rect = NSString (string: statusText).boundingRect(with: CGSize(width: view.frame.width, height: 10000), options: NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin), attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14 )], context: nil )
            let knownHeight: CGFloat = 8 + 44 + 4 + 4 + 200 + 8 + 24 + 8 + 44
            if view.frame.width<768{
                return CGSize(width: view.frame.width, height: rect.height + knownHeight + 24 )
            }
            else {
                return CGSize(width: view.frame.width * 0.85, height: rect.height + knownHeight + 24 )
            }
        }
        return CGSize(width: view.frame.width, height: 1000)
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView?.collectionViewLayout.invalidateLayout()
    }
}

extension FeedController{
    func getFeeds(){
        let firstPost = Post()
        firstPost.statusText = "Құрметті SPT 2018 қатысушылары!" +
            "\nСДУ ресми сайтының «SPT олимпиадасы» бөлімінде өзіңіз тіркелген тест орталығының нақты мекенжайын біле аласыз." +
            "\nНазар аударыңыз! Астана, Ақтөбе, Шымкент және Қызылорда тест орталықтарының кластерге байланысты екі түрлі мекенжайы бар. Мұқият болыңыз!" +
            "\nСәттілік тілейміз!" +
            "\n•••••" +
            "\nУважаемые участники SPT 2018!" +
            "\nНа официальном сайте СДУ в разделе «Олимпиада SPT» вы можете ознакомиться с адресом центра тестирования, который вы указали при регистрации." +
            "\nВнимание! Центры тестирования Астана, Актобе, Шымкент, Кызылорда имеют два адреса в зависимости от кластера." +
            "\nВсем удачи!" +
        "#sdukz #spt2018 #spteam #центр #тестирования"
        firstPost.statusImageName = "post1"
        firstPost.name = "Suleyman Demirel University"
        posts.append(firstPost)
        
        let secondPost = Post()
        secondPost.statusText = """
        Қымбатты SPT 2018 олимпиадасының қатысушылары!
        \nСіздердің назарларыңызға!
        \nҚұжаттарын онлайн тіркеп үлгерген оқушылардың барлығына ертең сағат 17.00-ге дейін ID карта (рұқсат қағазы) жіберілетін болады.
        \nАл тест орталықтарының нақты мекенжайы ертең сағат 21.00-де ресми сайтымызда (sdu.edu.kz) жарияланатын болады.
        \nСіздерге сәттілік тілейміз!
        \n#sdukz #spt2018 #spt
        """
        secondPost.statusImageName = "post2"
        secondPost.name = "Suleyman Demirel University"
        
        let thirdPost = Post()
        thirdPost.name = "Suleyman Demirel University"
        thirdPost.statusText = """
        «СДУшники, для вас отличная новость! Не упустите свой шанс от Neupusti.net Гранты, Стипендии, Конкурсы Данный проект - отличная возможность узнать свои силы, познакомиться с успешными людьми, а также принести пользу обществу. Участвуем!
        .•
        \nПроект «3.2.1. Старт!» создан специально для молодежи в возрасте от 18 до 29 лет – студентов колледжей, ВУЗов, молодых специалистов
        
        \nЛюбой молодой человек, желающий помочь в решении проблем своего региона, может отправить заявку на сайт проекта и таким образом, стать участником. Период приема заявок с 1 февраля по 5 марта 2018 года
        
        \nПрезентация проекта с участием спикеров Аси Тулесовой (Aua Group) и Армана Сулейменова (Zero To One Labs) состоится 16 февраля 2018 года в Smart.Point в г. Алматы с 17:00 до 19:00.
        \n#sdukz #neupustikz #конкурс #проект
        """
        thirdPost.statusImageName = "post3"
        
        posts.append(secondPost)
        posts.append(thirdPost)
    }
}



