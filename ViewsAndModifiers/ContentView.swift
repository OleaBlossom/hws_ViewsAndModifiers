//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Olea Blossom on 12.07.22.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		VStack(spacing: 10) {
			CapsuleText(text: "First")
				.foregroundColor(.white)
			CapsuleText(text: "Second")
				.foregroundColor(.primary)
		}
	}
}

@ViewBuilder var spells: some View {
	Text("CopyPasto")
	Text("Dleicioso")
	Text("Floralorial")
	Text("Herbio")
	Text("Homewardial")
	Text("Repario")
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

struct CapsuleText: View {
	var text: String
	
	var body: some View {
		Text(text)
			.font(.largeTitle)
			.padding()
			.background(.blue)
			.clipShape(Capsule())
	}
}
