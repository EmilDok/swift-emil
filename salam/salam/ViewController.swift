import UIKit

struct CellState {
    var selected:Bool
    init(){
        selected = false
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, IAloha {

    
    var cellsState:[CellState] = []
    
    
    let myPosts = ["kto", "ktoto2", "ktoto3", "ktoto4", "ktoto5"]
    let myTexts = [
        """
        Главные правила1:

        1) «мариновать» воду минимум 3-4 часа;
        2) после 12 часов фрукты/наполнители нужно поменять;
        3) хранить только в холодильнике, чтобы цитрусы не горчили
        4) срок годности общий — 3 дня;
        5) чтобы цитрусы не горчили, их нужно или очистить от цедры, или вынуть через 3-4 часа.
        
        
        """,
        """
        Главные правила2:

        1) «мариновать» воду минимум 3-4 часа;
        """,
        """
        Главные правила3:

        1) «мариновать» воду минимум 3-4 часа;
        2) после 12 часов фрукты/наполнители нужно поменять;

        
        
        """,
        """
        Главные правила4:

        1) «мариновать» воду минимум 3-4 часа;
        2) после 12 часов фрукты/наполнители нужно поменять;
        3) хранить только в холодильнике, чтобы цитрусы не горчили
        4) срок годности общий — 3 дня;
        5) чтобы цитрусы не горчили, их нужно или очистить от цедры, или вынуть через 3-4 часа.
        
        
        """,
        """
        Главные правила5:

        1) «мариновать» воду минимум 3-4 часа;
        2) после 12 часов фрукты/наполнители нужно поменять;
        3) хранить только в холодильнике, чтобы цитрусы не горчили
        4) срок годности общий — 3 дня;
        5) чтобы цитрусы не горчили, их нужно или очистить от цедры, или вынуть через 3-4 часа.
        
        
        """

    ]
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        
    
        tableView.delegate = self
        tableView.dataSource = self

        view.addSubview(tableView)
        
        setupTableView()
    }
    

    func setupTableView(){
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -1 * (self.tabBarController?.tabBar.frame.size
            .height)!).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPosts.count
    }
    
    func salam(){
        let certainRecipeViewController = CertainRecipeViewController()
        self.navigationController?.pushViewController(certainRecipeViewController, animated: true)
        print(self.navigationController)
    }
    
    //func cellfor
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.delegate = self
        
        cell.personName.text = myPosts[indexPath.row]
        cell.postText.text = myTexts[indexPath.row]
        cell.backgroundColor = .clear   	
        cell.selectionStyle = .none
 
        return cell
    }
}
//

