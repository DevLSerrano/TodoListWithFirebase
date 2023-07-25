//
//  ProgressIndicatorView.swift
//  TodoListWithFirebase
//
//  Created by Leonardo Serrano on 25/07/23.
//

import SwiftUI

struct ProgressIndicatorView: View {
    @State var progress = 0.6
    let animation = Animation
            .easeOut(duration: 3)
            .repeatForever(autoreverses: false)
            .delay(0.5)
    var body: some View {
      
        ZStack {
            Circle()
                            .stroke(lineWidth: 20.0)
                            .opacity(0.3)
                            .foregroundColor(Color.cyan)
                            .frame(width: 150)
                        
                        Circle()
                            .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                            .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                            .foregroundColor(Color.blue)
                            .rotationEffect(Angle(degrees: 270.0)).frame(width: 150)
                            
                        Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                            .font(.largeTitle)
                            .bold()
        } 
               
       
       
    }
    
}

struct ProgressIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressIndicatorView()
    }
}
