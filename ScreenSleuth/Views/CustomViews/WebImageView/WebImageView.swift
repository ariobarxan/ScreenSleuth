//
//  WebImageView.swift
//  ScreenSleuth
//
//  Created by Home on 6/3/2024.
//

import UIKit

final class WebImageView: UIImageView {
    private var viewModel: WebImageViewModel!
    
    func setup(withURLString urlString: String, name: String){
        viewModel = WebImageViewModel(urlString: urlString) { [unowned self] shouldShowLoading in
            self.showLoading(shouldShowLoading: shouldShowLoading)
        }
        Task {
            await setupImage(name: name)
        }
    }
    
    private func setupImage(name: String) async {
        do {
            let data = try await viewModel.getImageData()
            let image = UIImage(data: data)
            self.image = image
            //Log.d("Image was successfully downloaded")
        } catch {
            //let image =
           // self.image = image
            //Log.d("Image could not be downloaded")
        }
    }
    
    func showLoading(shouldShowLoading: Bool) {
        
    }
}
