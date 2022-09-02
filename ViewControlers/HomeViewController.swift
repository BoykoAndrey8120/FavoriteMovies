
import UIKit

class HomeViewController: UIViewController {
    
    var homeView = MainView()
    let reuseIdentifier = "cell"
    var movies = [Movie(title: "Interstellar", year: 2014), Movie(title: "The Shawshank Redemption", year: 1994)]
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeView.moviesTableView.delegate = self
        homeView.moviesTableView.dataSource = self
        homeView.addButton.addTarget(self, action: #selector(tapButton), for: .touchDown)
    }
    
    override func viewDidLayoutSubviews() {
        homeView.moviesTableView.reloadData()
    }
    
    //MARK: - Action
    
    @objc func tapButton(sender: UIButton!) {
        let modelMovie = Movie(
            title: homeView.textFieldTitle.text ?? "",
            year: Int(homeView.textFeildYear.text ?? "0") ?? 0)
        let year = Int(homeView.textFeildYear.text ?? "0") ?? 0
        if homeView.textFieldTitle.hasText && (year > 1900 && year < 2030)  {
            movies.append(modelMovie)
            homeView.moviesTableView.reloadData()
        }
    }
}
//MARK: - TableViewDelegate

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? MoviesTableViewCell
        cell?.setupCell(moive: movies[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
