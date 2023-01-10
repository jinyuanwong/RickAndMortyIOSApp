//
//  CharactersViewViewModels.swift
//  RickAndMorty
//
//  Created by shanxiafeng on 5/1/23.
//


import UIKit

protocol RMCharactersViewViewModelDelegate: AnyObject{
    func didLoadInitialCharacters ()
    func didSelectCharacter(_ character: RMCharacter)
}


// View model to handle character list view logic
final class RMCharactersViewViewModel: NSObject {
    
    public weak var delegate: RMCharactersViewViewModelDelegate?
    
    private var isLoadingMoreCharacters = false
    
    private var cellViewModels: [RMCharacterCollectionViewCellViewModel] = []
   
    private var apiInfo: RMGetAllCharactersResponse.Info? = nil
    
    private var characters: [RMCharacter] = []{
        didSet{
            for character in characters {
                let viewModel = RMCharacterCollectionViewCellViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image)
                )
                
                cellViewModels.append(viewModel)
            }
        }
    }
    
    
    // Fetch Initial characters
    func fetchCharacters() {
        RMService.shared.execute(
            .listCharactersRequests,
            expecting: RMGetAllCharactersResponse.self
        ){ [weak self] result in
            switch result {
            case .success(let resultModel):
                let results = resultModel.results
                let info = resultModel.info
                self?.characters = results
                self?.apiInfo = info
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharacters() 
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    
    
    public var shouldShowLoadMoreIndicator: Bool{
        return apiInfo?.next != nil
    }
    
    
    // Paginate if additional chracters are needed
    public func FetchAdditionnalCharacters(){
        isLoadingMoreCharacters = true

    }
}

// MARK - CollectionView

extension RMCharactersViewViewModel: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: RMCharacterCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? RMCharacterCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        let viewModel = cellViewModels[indexPath.row]
        cell.configure(with: viewModel)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionFooter,
              let footer = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: RMFooterLoadingCollectionReusableView.identifier,
                for: indexPath
              ) as? RMFooterLoadingCollectionReusableView else{
            fatalError("Unsupported!")
        }
        footer.startAnimating()
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        
        guard shouldShowLoadMoreIndicator else{
            return .zero
        }
        
        return CGSize(width: collectionView.frame.width,
                      height:100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bounds = UIScreen.main.bounds
        
        let width = (bounds.width - 30)/2
        
        return CGSize(
            width: width,
            height: width*1.5
        )
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let character = characters[indexPath.row]
        delegate?.didSelectCharacter(character)
    }
    
}

//MARK - ScrollView

extension RMCharactersViewViewModel: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView){
        //
        guard shouldShowLoadMoreIndicator,!isLoadingMoreCharacters else{
            return
        }
        let offset = scrollView.contentOffset.y
        let totalContentHeight = scrollView.contentSize.height
        let totalScrollViewFixedHeight = scrollView.frame.size.height
        
        if offset >= (totalContentHeight - totalScrollViewFixedHeight - 120){
            FetchAdditionnalCharacters()
        }
        

    }
}
