//
//  NetworkReconView\.swift
//  DissertationProject2023
//
//  Created by Louis on 14/03/2023.
//

import SwiftUI

struct NetworkReconView: View {
    var body: some View {
        VStack {
            UnixTerminalView()
                .frame(height: 400)
        }
    }
}

struct NetworkReconView__Previews: PreviewProvider {
    static var previews: some View {
        NetworkReconView()
    }
}
