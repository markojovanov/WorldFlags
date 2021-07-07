import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedFlag: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageToLoad = selectedFlag {
            imageView.image  = UIImage(named: imageToLoad)
        }
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 1
        imageView.clipsToBounds = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(tapShare))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    @objc func tapShare(){
        let flag = String((selectedFlag?.split(separator: "@")[0])!).uppercased()
        let vc = UIActivityViewController(activityItems: [imageView.image!,flag], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
