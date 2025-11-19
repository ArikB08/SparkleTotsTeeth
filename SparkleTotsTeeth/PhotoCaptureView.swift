//
//  PhotoCaptureView.swift
//  SparkleTotsTeeth
//

import SwiftUI

struct PhotoCaptureView: View {
    @State private var capturedImage: UIImage?
    
    var body: some View {
        CameraView(image: $capturedImage)
            .ignoresSafeArea()
    }
}

struct CameraView: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = context.coordinator
        picker.showsCameraControls = false
        
        let overlay = UIHostingController(rootView: CameraOverlayView(picker: picker))
        overlay.view.backgroundColor = .clear
        overlay.view.frame = UIScreen.main.bounds
        picker.cameraOverlayView = overlay.view
        
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        uiViewController.cameraOverlayView?.frame = uiViewController.view.bounds
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: CameraView
        
        init(_ parent: CameraView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.image = image.resize(maxWidth: 1024)
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}

extension UIImage {
    func resize(maxWidth: CGFloat) -> UIImage {
        guard size.width > maxWidth else { return self }
        let ratio = maxWidth / size.width
        let newSize = CGSize(width: maxWidth, height: size.height * ratio)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0)
        draw(in: CGRect(origin: .zero, size: newSize))
        let resized = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resized ?? self
    }
}

struct CameraOverlayView: View {
    let picker: UIImagePickerController
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Button(action: {}) {
                    Image(systemName: "ellipsis.circle")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color.black.opacity(0.35))
                        .clipShape(Circle())
                }
            }
            .padding(.top, 50)
            .padding(.trailing, 20)
            
            Spacer()
            
            TeethOverlayView()
                .frame(maxWidth: 320)
                .padding(.bottom, 50)
            
            Spacer()
            
            ZStack {
                Color.black.opacity(0.95)
                    .frame(height: 140)
                    .ignoresSafeArea(edges: .bottom)
                
                Button {
                    picker.takePicture()
                } label: {
                    ZStack {
                        Circle()
                            .stroke(Color.white.opacity(0.6), lineWidth: 3)
                            .frame(width: 96, height: 96)
                        Circle()
                            .fill(Color.white)
                            .frame(width: 80, height: 80)
                    }
                }
                .padding(.bottom, 24)
            }
        }
    }
}

struct TeethOverlayView: View {
    var body: some View {
        Image("teethOverlay")
            .resizable()
            .scaledToFit()
            .opacity(0.4)
    }
}

#Preview {
    PhotoCaptureView()
}

