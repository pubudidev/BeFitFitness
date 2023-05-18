//
//  ExercisePreviewViewController.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/18/23.
//

import UIKit
import WebKit

class ExercisePreviewViewController: UIViewController {
    
    private var ex: Exersice?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry potter"
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0 // that means this can take multiple lines
        label.text = "Best exercises"
        return label
    }()
    
    private let addtoScheduleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Add to schedule", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(webView)
        view.addSubview(titleLabel)
        view.addSubview(overviewLabel)
        view.addSubview(addtoScheduleButton)
        
        addtoScheduleButton.addTarget(self, action: #selector(downloadTitleAt), for: .touchUpInside)
        
        configureConstraints()
    }
    
    @objc private func downloadTitleAt() {
        print("Add to list")
        DataPersistenceManager.shared.downloadTitleWith(model: ex!) { result in
            switch result {
            case .success():
                NotificationCenter.default.post(name: NSNotification.Name("Added to list"), object: nil)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func configureConstraints() {
        let webViewConstraints = [
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.heightAnchor.constraint(equalToConstant: 300)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalTo: webView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let overviewLabelConstraints = [
            overviewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            overviewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        
        let downloadButtonConstraints = [
            addtoScheduleButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addtoScheduleButton.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 25),
            addtoScheduleButton.widthAnchor.constraint(equalToConstant: 140),
            addtoScheduleButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        
        NSLayoutConstraint.activate(webViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(overviewLabelConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
    }
    
    public func configure(with model: TitlePreviewViewModel, on exercise: Exersice?, isFromHome: Bool) {
        self.ex = exercise
        titleLabel.text = model.title
        overviewLabel.text = model.titleOverview
        
        self.addtoScheduleButton.isHidden = true
        if isFromHome {
            self.addtoScheduleButton.isHidden = false
        }
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    
}
