//
//  FacultyController.swift
//  SduProject
//
//  Created by Eldor Makkambaev on 30.04.2018.
//  Copyright © 2018 Eldor Makkambaev. All rights reserved.
//

import UIKit

struct Faculty {
    var name: String?
}

class FacultyController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var faculties = [Faculty]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.tabBarItem.image = #imageLiteral(resourceName: "faculty_image")
        let engineering = Faculty(name: "Engineering")
        let law = Faculty(name: "Law")
        let eco = Faculty(name: "Eco")
        let phil = Faculty(name: "Philology")
        faculties.append(engineering); faculties.append(law);
        faculties.append(eco); faculties.append(phil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faculties.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "faculty_cell", for: indexPath) as! FacultyCell
        cell.nameLabel.text = faculties[indexPath.row].name
        return cell
    }
    
    
}

