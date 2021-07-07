import UIKit

class ViewController: UITableViewController {
    var flags = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "World flags"
        navigationController?.navigationBar.prefersLargeTitles = true
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items{
            if(item.hasSuffix("3x.png")){
                flags.append(item)
            }
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Country", for: indexPath)
        let imageLoad = UIImage(named: flags[indexPath.row])
        cell.imageView?.image = imageLoad
        cell.textLabel?.text = String(flags[indexPath.row].split(separator: "@")[0]).uppercased()
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController{
            vc.selectedFlag = flags[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
