//
//  CharacterTableViewController.swift
//  Marvel Showcase
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 3/27/19.
//  Copyright © 2019 Chenzook. All rights reserved.
//
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.com
//

import UIKit
import MarvelAPI

class CharacterTableViewController: UITableViewController {

    var characterId: Int? {
        didSet {
            guard let id = characterId else { return }
            getCharachter(id: id)
        }
    }
    
    func getCharachter(id: Int) {
        do {
            characterDataTask = try CharactersRouter.Endpoint.Character.get(characterId: id, success: characterRequestDidSuccess, failure: characterRequestDidFailure)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private var characterDataTask: URLSessionDataTask?
    
    private let entities: [Entity]  = [.comics, .events, .series, .stories]
    var character: MarvelAPI.Entity.Core.Character? { didSet { setupData() } }
    
    private func setupData() {
        self.characterOverviewView.character = character
        tableView.reloadData()
    }
    
    lazy var originalHeaderHeight = characterOverviewView.minimumRequiredHieght + view.bounds.width
    
    lazy var characterOverviewView: CharacterOverviewView = {
        let view = CharacterOverviewView.nib!.instantiate(withOwner: self).first as! CharacterOverviewView
        return view
    }()
    
    lazy var emptyFooterView = UIView(frame: .zero)
    
    private func setupTableViewAppearance() {
        tableView.tableFooterView = emptyFooterView
        automaticallyAdjustsScrollViewInsets = false
        tableView.backgroundColor = #colorLiteral(red: 0.07450980392, green: 0.1137254902, blue: 0.1607843137, alpha: 1)
        tableView.separatorStyle = .none
    }
    
    private func setupHeaderView() {
        characterOverviewView.removeFromSuperview()
        tableView.contentInset.top = originalHeaderHeight
        characterOverviewView.frame.origin.y = -originalHeaderHeight
        characterOverviewView.frame.size.width = tableView.bounds.width
        tableView.addSubview(characterOverviewView)
        updateHeaderView(contentYOffset: tableView.contentOffset.y)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHeaderView()
        setupTableViewAppearance()
        regitserCells()
    }
    
    private func regitserCells() {
        for relation in entities {
            tableView.register(SummariesTableViewCell.nib, forCellReuseIdentifier: relation.title)
        }
    }

}

extension CharacterTableViewController {
    
    func characterRequestDidSuccess(character: MarvelAPI.Entity.Core.Character?) {
        self.character = character
    }
    
    func characterRequestDidFailure(error: MarvelAPI.Result<MarvelAPI.Entity.Core.Character>.Error) {
        print(error.status ?? "🚫")
    }
}

extension CharacterTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let entity = entities[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: entity.title) as? SummariesTableViewCell else {
            fatalError("Unknown cell")
        }
        
        let viewModel = SummariesTableViewCell.ViewModel(
            entity: entity,
            count: character?.availableItemsCount(for: entity),
            description: entity.summaryCollectionDescription(characterName: character?.name ?? "this character")
        )
        cell.viewModel = viewModel
        return cell
    }
}

extension CharacterTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SummariesTableViewCell.height
    }
}

extension CharacterTableViewController {
    
    func updateHeaderView(contentYOffset: CGFloat) {
        let extraHeight = contentYOffset < -originalHeaderHeight ? (-contentYOffset - originalHeaderHeight) : 0
        characterOverviewView.frame.size.height = originalHeaderHeight + extraHeight
        characterOverviewView.frame.origin.y = -originalHeaderHeight - extraHeight
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView(contentYOffset: scrollView.contentOffset.y)
    }
}

private extension Entity {
    
    func summaryCollectionDescription(characterName: String) -> String? {
        switch self {
        case .characters: assertionFailure("Not possible"); return nil
        case .creators: return self.title.firstCapitalized + " of " + characterName + "."
        case .comics: return self.title.firstCapitalized + " which feature " + characterName + "."
        case .events, .series, .stories: return self.title.firstCapitalized + " which " + characterName + " appears in."
        }
    }
}
