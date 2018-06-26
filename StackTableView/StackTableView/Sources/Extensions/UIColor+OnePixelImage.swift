import UIKit

extension UIColor {
    
    func asOnePixelImage() -> UIImage {
        let imageSize = CGSize(width: 1, height: 1)
        let renderrer = UIGraphicsImageRenderer(size: imageSize)
        return renderrer.image { context in
            let cgContext = context.cgContext
            cgContext.setFillColor(cgColor)
            cgContext.fill(CGRect(origin: .zero, size: imageSize))
        }
    }
}
