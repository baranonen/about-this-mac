//
//  ContentView.swift
//  AboutThisMac
//
//  Created by Baran Önen on 17.02.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Sidebar()
        }
        .frame(width: 570, height: 250)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: toggleSidebar, label: {
                    Image(systemName: "sidebar.leading")
                })
            }
        }
    }
}

func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}

struct Sidebar: View {
    @State var selection: Int?
    var body: some View {
        List {
            NavigationLink(destination: GeneralView(), tag: 0, selection: self.$selection) {
                Image(systemName: "info.circle")
                    .frame(width: 30, height: 20, alignment: .center)
                Text("General")
            }
            NavigationLink(destination: DisplaysView(), tag: 1, selection: self.$selection) {
                Image(systemName: "display")
                    .frame(width: 30, height: 20, alignment: .center)
                Text("Displays")
            }
            NavigationLink(destination: StorageView(), tag: 2, selection: self.$selection) {
                Image(systemName: "internaldrive.fill")
                    .frame(width: 30, height: 20, alignment: .center)
                Text("Storage")
            }
            NavigationLink(destination: SupportView(), tag: 3, selection: self.$selection) {
                Image(systemName: "person.fill.questionmark")
                    .frame(width: 30, height: 20, alignment: .center)
                Text("Support")
            }
            NavigationLink(destination: ServiceView(), tag: 4, selection: self.$selection) {
                Image(systemName: "wrench.and.screwdriver")
                    .frame(width: 30, height: 20, alignment: .center)
                Text("Service")
            }
        }
        .onAppear {
            self.selection = 0
        }
        .listStyle(SidebarListStyle())
    }
}

struct GeneralView: View {
    var body: some View {
        VStack {
            HStack {
                Image("macOSLogo")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                VStack(alignment: .leading, spacing: nil) {
                    HStack(spacing: 0) {
                        Text("macOS")
                            .font(.title)
                            .fontWeight(.medium)
                        Text(" Big Sur")
                            .font(.title)
                            .fontWeight(.light)
                    }
                    Text("Version 11.2")
                }
            }
            .padding()
            .padding(.leading, -37.0)
            VStack(alignment: .leading, spacing: 5) {
                Group {
                HStack {
                    Image(systemName: "laptopcomputer")
                        .frame(width: 20, alignment: .center)
                    Text("MacBook Pro (13-inch, M1, 2020)")
                        .fontWeight(.semibold)
                }
                HStack {
                    Image(systemName: "cpu")
                        .frame(width: 20, alignment: .center)
                    Text("Chip")
                        .fontWeight(.semibold)
                    Text("Apple M1")
                }
                HStack {
                    Image(systemName: "memorychip")
                        .frame(width: 20, alignment: .center)
                    Text("Memory")
                        .fontWeight(.semibold)
                    Text("16 GB")
                }
                HStack {
                    Image(systemName: "number")
                        .frame(width: 20, alignment: .center)
                    Text("Serial")
                        .fontWeight(.semibold)
                    Text("X01XXX01XXX0")
                        .font(.system(size: 14, design: .monospaced))
                }
                }
                .padding(.leading, 60.0)
            }
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Link(destination: URL(string: "x-apple.systempreferences:com.apple.preference.displays")!, label: {
                    Text("Software Update")
                })
            }
        }
        .navigationTitle("General")
        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct DisplaysView: View {
    var body: some View {
        VStack {
            Image(systemName: "laptopcomputer")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .center)
            Text("Built-in Retina Display")
                .font(.title)
            Text("13.3-inches (2560 x 1600)")
                .font(.callout)
                .foregroundColor(.secondary)
        }
        .navigationTitle("Displays")
        .padding()
        .background(Color(NSColor.controlBackgroundColor))
        .cornerRadius(15.0)
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Link(destination: URL(string: "x-apple.systempreferences:com.apple.preference.displays")!, label: {
                    Text("Display Settings")
                })
            }
        }
    }
}

struct StorageView: View {
    var body: some View {
        HStack {
            ZStack {
                VStack {
                    
                Image(systemName: "internaldrive.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40, alignment: .center)
                    
                Text("Macintosh HD")
                    .font(.title3)
                }
                Circle()
                    .stroke(lineWidth: 15.0)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                    .frame(width: 150, height: 150, alignment: .center)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(0.13))
                    .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.green)
                    .rotationEffect(Angle(degrees: 270.0))
                    .frame(width: 150, height: 150, alignment: .center)
                Circle()
                    .trim(from: 0.13, to: CGFloat(0.18))
                    .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.purple)
                    .rotationEffect(Angle(degrees: 270.0))
                    .frame(width: 150, height: 150, alignment: .center)
                Circle()
                    .trim(from: 0.18, to: CGFloat(0.30))
                    .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.red)
                    .rotationEffect(Angle(degrees: 270.0))
                    .frame(width: 150, height: 150, alignment: .center)
                Circle()
                    .trim(from: 0.30, to: CGFloat(0.33))
                    .stroke(style: StrokeStyle(lineWidth: 15.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.gray)
                    .rotationEffect(Angle(degrees: 270.0))
                    .frame(width: 150, height: 150, alignment: .center)
            }
            .padding()
            Spacer()
            VStack(alignment: .leading) {
                Text("1 TB Flash Storage")
                Text("700 GB available")
                    .font(.caption)
                    .foregroundColor(.secondary)
                HStack {
                    Rectangle()
                        .foregroundColor(.gray)
                        .opacity(0.3)
                        .frame(width: 20, height: 20, alignment: .center)
                        .cornerRadius(5.0)
                    Text("Free Space")
                    Spacer()
                    Text("700 GB")
                        .foregroundColor(.secondary)
                }
                HStack {
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(width: 20, height: 20, alignment: .center)
                        .cornerRadius(5.0)
                    Text("Documents")
                    Spacer()
                    Text("70 GB")
                        .foregroundColor(.secondary)
                }
                HStack {
                    Rectangle()
                        .foregroundColor(.purple)
                        .frame(width: 20, height: 20, alignment: .center)
                        .cornerRadius(5.0)
                    Text("Developer")
                    Spacer()
                    Text("22 GB")
                        .foregroundColor(.secondary)
                }
                HStack {
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(width: 20, height: 20, alignment: .center)
                        .cornerRadius(5.0)
                    Text("Apps")
                    Spacer()
                    Text("75 GB")
                        .foregroundColor(.secondary)
                }
                HStack {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(width: 20, height: 20, alignment: .center)
                        .cornerRadius(5.0)
                    Text("System")
                    Spacer()
                    Text("20 GB")
                        .foregroundColor(.secondary)
                }
            }
            .padding()
        }
        .padding(.horizontal)
        .navigationTitle("Storage")
    }
}

struct SupportView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("macOS Resources")
                    .multilineTextAlignment(.leading)
                    .frame(width: 140, alignment: .leading)
                
                Spacer()
                Image("macOSLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60, alignment: .center)
                Spacer()
                VStack(alignment: .leading) {
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Text("macOS Help")
                            .font(.subheadline)
                        Image(systemName: "chevron.right")
                    })
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Text("User Manual")
                            .font(.subheadline)
                        Image(systemName: "chevron.right")
                    })
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Text("macOS Support")
                            .font(.subheadline)
                        Image(systemName: "chevron.right")
                    })
                }
                .frame(width: 160, alignment: .leading)
            }
            Spacer()
            Divider()
            Spacer()
            HStack {
                Text("Mac Resources")
                    .multilineTextAlignment(.leading)
                    .frame(width: 140, alignment: .leading)
                Spacer()
                Image(systemName: "laptopcomputer")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60, alignment: .center)
                Spacer()
                VStack(alignment: .leading) {
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Text("Specifications")
                            .font(.subheadline)
                        Image(systemName: "chevron.right")
                    })
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Text("Hardware Support")
                            .font(.subheadline)
                        Image(systemName: "chevron.right")
                    })
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Text("Regulatory Certifications")
                            .font(.subheadline)
                        Image(systemName: "chevron.right")
                    })
                    Link(destination: URL(string: "https://www.apple.com")!, label: {
                        Text("Important Information")
                            .font(.subheadline)
                        Image(systemName: "chevron.right")
                    })
                }
                .frame(width: 160, alignment: .leading)
            }
            Spacer()
        }
        .navigationTitle("Support")
        .padding()
    }
}

struct ServiceView: View {
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "wrench.and.screwdriver")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .padding([.top, .leading])
            VStack(alignment: .leading) {
                Text("Every Mac comes with a limited warranty from Apple and up to 90 days of complimentary telephone technical support.")
                    .font(.subheadline)
                Text("If you have purchased an AppleCare product, you get up to three years of expert telephone technical support and additional hardware service options from Apple. AppleCare product benefits are in addition to any legal rights provided by consumer protection laws.")
                    .font(.subheadline)
                Text("If you require repairs and your coverage has expired, you can have them performed by an Apple-authorized technician for a fee.")
                    .font(.subheadline)
                Link(destination: URL(string: "https://www.apple.com")!, label: {
                    Text("Check my service and support coverage status")
                        .font(.subheadline)
                    Image(systemName: "chevron.right")
                })
                Link(destination: URL(string: "https://www.apple.com")!, label: {
                    Text("Show my service and repair options")
                        .font(.subheadline)
                    Image(systemName: "chevron.right")
                })
            }
            .padding()
        }
        .navigationTitle("Service")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        GeneralView()
        DisplaysView()
        StorageView()
        SupportView()
        ServiceView()
    }
}
