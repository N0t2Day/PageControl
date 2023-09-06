//
//  PageControl.swift
//  PageControl
//
//  Created by Artem Kedrov on 06.09.2023.
//

import SwiftUI


struct ContentView: View {
    
    let dotsArray: [Int] = Array(stride(from: 0, to: 15, by: 1))
    @State var currentIndex: Int = 0
    let spacing: CGFloat = 8.0
    let sizeRatio: CGFloat = 10.0
    let sizeRatioScale: CGFloat = 0.5
    var visibleDots: Int {
        dotsArray.count % 2 == 1 ? dotsArray.count / 2 : dotsArray.count / 2 + 1
    }
    var body: some View {
        ZStack {
            VStack {
                Text("Index \(currentIndex)")
                Capsule()
                    .foregroundColor(.red.opacity(0.5))
                    .frame(width: dotsArray.count > visibleDots ? CGFloat(sizeRatio + spacing) * CGFloat(visibleDots % 2 == 0 ? visibleDots + 1 : visibleDots) : CGFloat(dotsArray.count) * CGFloat(sizeRatio + spacing), height: 32)
                    .overlay(
                        HStack(spacing: spacing) {
                            ForEach(dotsArray, id: \.self) { index in
                                Circle()
                                    .frame(width:  index == (currentIndex <= visibleDots / 2 ? visibleDots / 2 : currentIndex) + visibleDots / 2 ? sizeRatio * 0.5 : sizeRatio)
                                    .foregroundColor(index == currentIndex ? .black : .white)
                                    .frame(width: sizeRatio, height: sizeRatio)
                            }
                        }
//                            .background(Color.yellow)
                            .offset(x: xOffset())
                    )
                HStack {
                    Button {
                        guard currentIndex > 0 else { return }
                        currentIndex -= 1
                    } label: {
                        Text("-")
                            .font(.title)
                            .padding()
                    }
                    
                    Button {
                        guard currentIndex < dotsArray.count - 1 else { return }
                        currentIndex += 1
                    } label: {
                        Text("+")
                            .font(.title)
                            .padding()
                    }
                }
                .padding()
                
            }
            Color.red.frame(width: 1.0)
        }
        .animation(.linear, value: currentIndex)
    }
    
    private func xOffset() -> CGFloat {
        let xOffset = CGFloat(dotsArray.count - 1) * (sizeRatio + spacing) * 0.5 -
                CGFloat(currentIndex - visibleDots / 2 <= .zero ? visibleDots / 2 : currentIndex > dotsArray.count - 1 - visibleDots / 2 ? dotsArray.count - 1 - visibleDots / 2 : currentIndex)
                * CGFloat(sizeRatio + spacing)
        print("offset \(xOffset)")
        return xOffset
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView2: View {
    
    let dotsArray: [Int] = Array(stride(from: 0, to: 15, by: 1))
    @State var currentIndex: Int = 0
    let spacing: CGFloat = 8.0
    let sizeRatio: CGFloat = 10.0
    let sizeRatioScale: CGFloat = 0.5
    var visibleDots: Int {
        dotsArray.count % 2 == 1 ? dotsArray.count / 2 : dotsArray.count / 2 + 1
    }
    var body: some View {
        ZStack {
//            Color.red.opacity(0.1)
            VStack {
                Text("Index \(currentIndex)")
                Capsule()
                    .foregroundColor(.white)
                    .frame(width: dotsArray.count > visibleDots ? CGFloat(sizeRatio + spacing) * CGFloat(visibleDots % 2 == 0 ? visibleDots + 1 : visibleDots) : CGFloat(dotsArray.count) * CGFloat(sizeRatio + spacing), height: 32)
                    .overlay(
                        HStack(spacing: spacing) {
                            ForEach(dotsArray, id: \.self) { index in
                                Circle()
//                                    .frame(width:  index == (currentIndex <= visibleDots / 2 ? visibleDots / 2 : currentIndex) + visibleDots / 2 ? sizeRatio * 0.5 : sizeRatio)
                                    .frame(width: index > visibleDots / 2 - 1 + (currentIndex <= visibleDots / 2 ? visibleDots / 2 : currentIndex) ? sizeRatio * 0.5 : sizeRatio )
                                    .foregroundColor(index == currentIndex ? .red : .red.opacity(0.5) )
                                    .frame(width: sizeRatio, height: sizeRatio)
                            }
                        }
                        .offset(x: xOffset())
                    )
                    .mask {
                        Color.white
                            .blendMode(.destinationOver)
                    }
                HStack {
                    Button {
                        guard currentIndex > 0 else { return }
                        currentIndex -= 1
                    } label: {
                        Text("-")
                            .font(.title)
                            .padding()
                    }
                    
                    Button {
                        guard currentIndex < dotsArray.count - 1 else { return }
                        currentIndex += 1
                    } label: {
                        Text("+")
                            .font(.title)
                            .padding()
                    }
                }
                .padding()
                
            }
            Color.red.frame(width: 1.0)
        }
        .animation(.linear, value: currentIndex)
    }
    
    private func xOffset() -> CGFloat {
        let xOffset = CGFloat(dotsArray.count - 1) * (sizeRatio + spacing) * 0.5 -
                CGFloat(currentIndex - visibleDots / 2 <= .zero ? visibleDots / 2 : currentIndex > dotsArray.count - 1 - visibleDots / 2 ? dotsArray.count - 1 - visibleDots / 2 : currentIndex)
                * CGFloat(sizeRatio + spacing)
        return xOffset
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
