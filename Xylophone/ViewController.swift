import AVFoundation
import UIKit

class ViewController: UIViewController {
    var player: AVAudioPlayer!

    @IBAction func keyPressed(_ sender: UIButton) {
        sender.layer.opacity = 0.5

        if let note = sender.currentTitle {
            playSound(note: note)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            sender.layer.opacity = 1
        }
    }

    func playSound(note: String) {
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
