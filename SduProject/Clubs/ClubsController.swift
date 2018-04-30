//
//  ClubsController.swift
//  SduProject
//
//  Created by Eldor Makkambaev on 30.04.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import UIKit

struct Club {
    var name: String?
    var image: UIImage?
    var description: String?
}

class ClubsController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var myCollectionView: UICollectionView!
    var clubs = [Club]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.tabBarItem.image = #imageLiteral(resourceName: "club_image")
        
        let bgImage = UIImageView();
        bgImage.image = #imageLiteral(resourceName: "club_background2")
        bgImage.alpha = 0.5
        
        bgImage.contentMode = .scaleToFill
        
        bgImage.alpha = 0.5
        myCollectionView.backgroundColor = UIColor.black
        myCollectionView.backgroundView = bgImage
        
        getClubs()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return clubs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "club_cell", for: indexPath) as! ClubCell
        
        cell.imageClub.image = clubs[indexPath.row].image
        cell.nameLabel.text = clubs[indexPath.row].name
        
        cell.contentView.layer.cornerRadius = 4
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}

extension ClubsController{
    func getClubs(){
        let club1 = Club(name: "Education club", image: #imageLiteral(resourceName: "club1"), description: "Education Club – это клуб преуспевающих студентов, которые помогают всем желающим повысить их уровень знаний в интересующих областях как в рамках университета, так и за ними. За долгие годы успешной работы клуб регулярно проводит дополнительные занятия, организовывает мероприятия и реализовывает проекты приносящие пользу школьникам и студентам в сфере образования.")
        let club2 = Club(name: "Debate club", image: #imageLiteral(resourceName: "club2"), description: """
        \nЦель: C помощью развития красноречия и ораторского искусства в человеке, подготовить политически устойчивых личностей и лидеров со своим собственным мнением, которые внесут внушительный вклад в страну.

        \nМиссия: способствовать в строении гражданского общества с помощью улучшения правовых понятий.

        \nДевиз: В словах - значение, в действиях - достижение!
        """)
        
        clubs.append(club1); clubs.append(club2)
    }

}
