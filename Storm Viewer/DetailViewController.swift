//
//  DetailViewController.swift
//  Storm Viewer
//
//  Created by Nick Krasnitskiy on 28.04.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    var picturesPosition = 0
    var amoutOfImages = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Picture \(picturesPosition + 1) of \(amoutOfImages)"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }
    
}
