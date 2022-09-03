
import UIKit
import OrderedCollections

class HomeViewController: UIViewController {
    
    var homeView = MainView()
    let reuseIdentifier = "cell"
    var moviesSet:  OrderedSet<Movie> = [Movie(title: "Interstellar", year: 2014), Movie(title: "The Shawshank Redemption", year: 1994)]
    
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
    
    //MARK: - Action
    
    @objc func tapButton(sender: UIButton!) {
        let modelMovie = Movie(
            title: homeView.textFieldTitle.text?.trimmingCharacters(in: .whitespaces) ?? "",
            year: Int(homeView.textFeildYear.text?.trimmingCharacters(in: .whitespaces) ?? "0") ?? 0)
        let movieContaints = moviesSet.contains(modelMovie)
        if homeView.textFieldTitle.hasText && (modelMovie.year > 1900 && modelMovie.year < 2030) && movieContaints == false {
            addToFavourite(modelMovie: modelMovie)
        }
    }
    
    func addToFavourite(modelMovie: Movie) {
        moviesSet.insert(modelMovie, at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        homeView.moviesTableView.insertRows(at: [indexPath], with: .bottom)
    }
}

    //MARK: - TableViewDelegate
    
    extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return moviesSet.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? MoviesTableViewCell
            cell?.setupCell(moive: moviesSet[indexPath.row])
            return cell ?? UITableViewCell()
        }
    }


