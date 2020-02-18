

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TableViewB: UITableView!
    
    @IBOutlet weak var SearchBar: UISearchBar!
    
    
    var myArray = ["Bangladesh","USA","Australia","India"]
       
       var mySearch = [String]()
       var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
    //TableView
extension ViewController: UITableViewDataSource,UITableViewDelegate {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         if searching{
            return mySearch.count
    }   else  {
        return myArray.count
    }
 }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
    cell?.accessoryType = .disclosureIndicator
    
       if searching {
        cell?.textLabel?.text = mySearch[indexPath.row]
    } else   {
        
        cell?.textLabel?.text = myArray[indexPath.row]
    }
    return cell!
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
}
     //SearchBar
extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        mySearch = myArray.filter({$0.lowercased() .prefix(searchText.count) ==
            searchText.lowercased()})
        searching = true
        self.TableViewB.reloadData()
        func searchBarCancelButtonClicked(_searchBar: UISearchBar)
        {
            searching = false
            searchBar.text = ""
            TableViewB.reloadData()
        }
        
    }
}
