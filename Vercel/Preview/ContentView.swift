//
//  ContentView.swift
//  Preview
//
//  Created by De-Great Yartey on 06/11/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScreenSaver()
    }
}

struct ScreenSaver: NSViewRepresentable {
  func makeNSView(context: Context) -> VercelView {
    return VercelView()
  }
  
  func updateNSView(_ nsView: VercelView, context: Context) {
    
  }
  
  typealias NSViewType = VercelView
  
  
}

#Preview {
    ContentView()
}
