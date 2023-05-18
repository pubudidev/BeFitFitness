//
//  HomeViewController.swift
//  BeFitFitness
//
//  Created by Pubudidev on 5/12/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var exercises: [Exersice] = [Exersice]()
    
    private let upcomingTable: UITableView = {
        
        let table = UITableView()
        table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Upcoming"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(upcomingTable)
        upcomingTable.delegate = self
        upcomingTable.dataSource = self
        
        fetchUpcoming()
    }
    
    // setting this e an see the table with data.
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upcomingTable.frame = view.bounds
    }
    
    // get omly upcoming
    private func fetchUpcoming() {
        // to avoid memory leak [weak self]
        ExerciseAPICaller.shared.getUpcomingExercises { [weak self] result in
            switch result {
            case .success(let exercise):
                self?.exercises = exercise
                // make sure to run this in main thread
                DispatchQueue.main.async {
                    self?.upcomingTable.reloadData()
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
            return UITableViewCell()
        }
        
        let exercise = exercises[indexPath.row]

        cell.configure(with: TitleViewModel(titleName: (exercise.original_title ?? exercise.original_name) ?? "Unknown title name", posterURL: exercise.poster_path ?? ""))
        return cell
    }
    
    
    /// height of the row
    /// - Parameters:
    ///   - tableView: table
    ///   - indexPath: index number
    /// - Returns: int value
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    
    /// Call when youser tap a row
    /// - Parameters:
    ///   - tableView: table
    ///   - indexPath: intex of tapped row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let exercise = exercises[indexPath.row]

        guard let exerciseName = exercise.original_title ?? exercise.original_name else {
            return
        }
        
        ExerciseAPICaller.shared.getExercise(with: exerciseName) { [weak self] result in
            switch result {
            case .success(let videoElement):
                DispatchQueue.main.async {
                    let vc = ExercisePreviewViewController()
                    vc.configure(with: TitlePreviewViewModel(title: exerciseName , youtubeView: videoElement, titleOverview: exercise.overview ?? ""))
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
