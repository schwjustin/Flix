//
//  MovieDetailsViewController.swift
//  flix
//
//  Created by Justin Schwartz on 7/16/21.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisView: UILabel!
    
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        synopsisView.text = movie["overview"] as? String
        synopsisView.sizeToFit()
        
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as? String ?? ""
    
        let posterURL = URL(string: baseURL + posterPath) ?? URL(string: "about:blank")!
        
        posterView.af.setImage(withURL: posterURL)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/original" + backdropPath) ?? URL(string: "about:blank")!
        
        backdropView.af.setImage(withURL: backdropUrl)
    }
}
