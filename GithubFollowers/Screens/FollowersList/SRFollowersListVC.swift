//
//  SRFollowersListVC.swift
//  GithubFollowers
//
//  Created by Srinivasan Rajendran on 2020-04-02.
//  Copyright © 2020 Srinivasan Rajendran. All rights reserved.
//

import UIKit

class SRFollowersListVC: SRDataLoadingVC {

    enum Section {
        case main
    }

    var username: String = ""
    var page = 1
    var followers: [Follower] = []
    var filteredFollowers: [Follower] = []
    var userHasMoreFollowers = true

    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!

    init(username: String) {
        super.init(nibName: nil, bundle: nil)
        self.username = username
        title = username
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        configureSearchController()
        configureCollectionView()
        configureDataSource()
        getFollowers(username: username, page: page)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func getNumberOfColumns() -> Int {
        let horizontalSize = self.traitCollection.horizontalSizeClass
        switch horizontalSize {
        case .compact:
            return 3
        case .regular:
            return 5
        default:
            return 3
        }
    }

    func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: SRCollectionViewLayout.createColumnFlowLayout(view: view, numberOfColumns: getNumberOfColumns()))
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.reuseID)
        collectionView.delegate = self
        collectionView.backgroundColor = .white
    }

    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for username"
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }

    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPAth, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.reuseID, for: indexPAth) as! FollowerCell
            cell.set(follower: follower)
            return cell
        })
    }

    func updateData(on followersList: [Follower]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])

        snapshot.appendItems(followersList)
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }

    func getFollowers(username: String, page: Int) {
        showLoadingView()
        NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] result in
            guard let self = self else { return }
            self.hideLoadingView()
            switch result {
            case .success(let followers):
                if followers.count < 100 {
                    self.userHasMoreFollowers = false
                }
                self.followers.append(contentsOf: followers)

                if self.followers.isEmpty {
                    let message = "This user doesn't have any followers. Go follow them 😄."
                    DispatchQueue.main.async {
                        self.showEmptyStateView(withMessage: message, in: self.view)
                    }
                    return
                }

                self.page += 1
                if self.filteredFollowers.isEmpty{
                    self.updateData(on: self.followers)
                } else {
                    DispatchQueue.main.async {
                        self.updateSearchResults(for: self.navigationItem.searchController!)
                    }
                }

            case .failure(let error):
                self.presentSRAlertOnMainThread(title: "Bad Stuff Happened 😭", message: error.rawValue, buttonTitle: "Oh no!")
            }

        }
    }
}

extension SRFollowersListVC: UICollectionViewDelegate{

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY             = scrollView.contentOffset.y
        let contentHeight       = scrollView.contentSize.height
        let height              = scrollView.frame.size.height


        if offsetY > contentHeight - height {
            guard userHasMoreFollowers else { return }
            getFollowers(username: username, page: page)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentArray = filteredFollowers.isEmpty ? followers : filteredFollowers
        let follower = currentArray[indexPath.item]
        let destVC = UserInfoVC()
        destVC.username = follower.login
        destVC.delegate = self
        let navController = UINavigationController(rootViewController: destVC)
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true)
    }
}

extension SRFollowersListVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            filteredFollowers.removeAll()
            updateData(on: followers)
            return
        }

        filteredFollowers = followers.filter { $0.login.lowercased().contains(filter.lowercased()) }
        updateData(on: filteredFollowers)
    }
}

extension SRFollowersListVC: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredFollowers.removeAll()
        updateData(on: followers)
    }
}

extension SRFollowersListVC: FollowerListVCDelegate {
    func didRequestFollowers(for username: String) {
        self.username   = username
        title           = username
        page            = 1

        filteredFollowers.removeAll()
        if !(navigationItem.searchController?.searchBar.text?.isEmpty ?? true) {
            navigationItem.searchController?.searchBar.text = ""
            navigationItem.searchController?.isActive = false
            DispatchQueue.main.async {
                self.navigationItem.searchController?.searchBar.resignFirstResponder()
                self.navigationItem.searchController?.dismiss(animated: false)
            }
        }
        followers.removeAll()
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        getFollowers(username: username, page: page)
    }
}
