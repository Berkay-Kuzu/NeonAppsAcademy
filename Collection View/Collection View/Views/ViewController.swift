//
//  ViewController.swift
//  Collection View
//
//  Created by Berkay Kuzu on 10.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var info: [Info] = []
    
    let appsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 60
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.refreshControl?.isContextMenuInteractionEnabled = true
        collectionView.isUserInteractionEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        //        collectionView.backgroundColor = .red
        return collectionView
    }()
    
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        addSubviews()
        applyConstraints()
        configData()
        configureNavBar()
        
        title = "Neon Apps"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .white
        
        appsCollectionView.delegate = self
        appsCollectionView.dataSource = self
        appsCollectionView.register(InfoCollectionViewCell.self, forCellWithReuseIdentifier: InfoCollectionViewCell.identifier)
        
        
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        appsCollectionView.addSubview(refreshControl)
    }
    
    private func addSubviews() {
        view.addSubview(appsCollectionView)
    }
    
    private func applyConstraints() {
        appsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
    }
    
    private func configureNavBar() {
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Neon Apps", style: .done, target: nil, action: nil)
    }
    
    @objc func refreshData() {
        refreshControl.endRefreshing()
    }
    
    private func configData() {
        info = [
            Info(appName: "Interior Magic AI", appIcon: UIImage(named: "InteriorMagicAIwebp"), releaseDate: "2022", appCategory: "Photo & Video", appStoreURL: URL(string: "https://apps.apple.com/tr/app/interior-magic-ai/id6449483097")),
            Info(appName: "Sakura-AnimeAIFilter", appIcon: UIImage(named: "SakuraAnime AIFilter"), releaseDate: "2023", appCategory: "Photo & Video", appStoreURL: URL(string: "https://apps.apple.com/tr/app/sakura-anime-ai-filter/id6447250609")),
            Info(appName: "Teleprompter Application", appIcon: UIImage(named: "TeleprompterApplication"), releaseDate: "2022", appCategory: "Photo & Video", appStoreURL: URL(string: "https://apps.apple.com/tr/app/teleprompter-application/id1669501300")),
            Info(appName: "Astra AI: Video Avatars", appIcon: UIImage(named: "AstraAIVideoAvatars"), releaseDate: "2022", appCategory: "Photo & Video", appStoreURL: URL(string: "https://apps.apple.com/tr/app/astra-ai-video-avatars/id6446231105")),
            Info(appName: "Vision AI: Avatar Creator", appIcon: UIImage(named: "VisionAIAvatarCreator"), releaseDate: "2023", appCategory: "Photo & Video", appStoreURL: URL(string: "https://apps.apple.com/tr/app/vision-ai-avatar-creator/id1659708041")),
            Info(appName: "Tofy: Baby Sleep & White Noise", appIcon: UIImage(named: "TofyBabySleepWhiteNoise"), releaseDate: "2022", appCategory: "Health and Fitness", appStoreURL: URL(string: "https://apps.apple.com/tr/app/tofy-baby-sleep-white-noise/id1602210371")),
            Info(appName: "Secret Vault: Hide Your Data", appIcon: UIImage(named: "SecretValultHideYourData"), releaseDate: "2023", appCategory: "Productivity", appStoreURL: URL(string: "https://apps.apple.com/tr/app/secret-vault-hide-your-data/id1587893888")),
            Info(appName: "Smart Cleaner: Free Up Space", appIcon: UIImage(named: "SmartCleanerFreeUpSpace"), releaseDate: "2022", appCategory: "Utilities", appStoreURL: URL(string: "https://apps.apple.com/tr/app/smart-cleaner-free-up-space/id1576477935")),
            Info(appName: "Easy Scanner: Simple Scan", appIcon: UIImage(named: "EasyScannerSimpleScan"), releaseDate: "2022", appCategory: "Business", appStoreURL: URL(string: "https://apps.apple.com/tr/app/easy-scanner-simple-scan/id1578889257")),
            Info(appName: "ScanMath: Math Problem Solver", appIcon: UIImage(named: "ScanMathMathProblemSolver"), releaseDate: "2022", appCategory: "Education", appStoreURL: URL(string: "https://apps.apple.com/tr/app/scanmath-math-problem-solver/id1579327832")),
            Info(appName: "Adblocker: Website Ad Blocker", appIcon: UIImage(named: "AdblockerWhiteAdBlocker"), releaseDate: "2022", appCategory: "Utilities", appStoreURL: URL(string: "https://apps.apple.com/tr/app/adblocker-website-ad-blocker/id1576153746")),
            Info(appName: "Sleep Sound & White Noise", appIcon: UIImage(named: "SleepSoundWhiteNoise"), releaseDate: "2022", appCategory: "Utilities", appStoreURL: URL(string: "https://apps.apple.com/tr/app/sleep-sound-white-noise/id1572693948")),
            Info(appName: "Kids Sleep Sounds & Meditation", appIcon: UIImage(named: "KidsSleepSoundsMeditation"), releaseDate: "2023", appCategory: "Meditation & Health", appStoreURL: URL(string: "https://apps.apple.com/tr/app/kids-sleep-sounds-meditation/id1571680679")),
            Info(appName: "Font Manager & Text Changer", appIcon: UIImage(named: "FontManagerTextChanger"), releaseDate: "2022", appCategory: "Utilities", appStoreURL: URL(string: "https://apps.apple.com/tr/app/font-manager-text-changer/id1532647924")),
            Info(appName: "Highlight Maker: Story Covers", appIcon: UIImage(named: "HighlightMakerStoryCovers"), releaseDate: "2023", appCategory: "Utilities", appStoreURL: URL(string: "https://apps.apple.com/tr/app/highlight-maker-story-covers/id1529429604")),
            Info(appName: "Bree: Breathing Exercise", appIcon: UIImage(named: "BreeBreathingExercises"), releaseDate: "2023", appCategory: "Health & Fitness", appStoreURL: URL(string: "https://apps.apple.com/tr/app/bree-breathing-exercises/id1527756593")),
            Info(appName: "Hypnosis - Mindfullness", appIcon: UIImage(named: "HypnosisMindfullness"), releaseDate: "2023", appCategory: "Utilities", appStoreURL: URL(string: "https://apps.apple.com/tr/app/hypnosis-mindfullness/id1555060954")),
            Info(appName: "Motivation: Daily Affirmation", appIcon: UIImage(named: "MotivationDailyAffirmation"), releaseDate: "2022", appCategory: "Health & Fitness", appStoreURL: URL(string: "https://apps.apple.com/tr/app/motivation-daily-affirmation/id1555060437")),
        ]
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return info.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCollectionViewCell.identifier, for: indexPath) as! InfoCollectionViewCell
        cell.setup(info[indexPath.row])
        //        cell.backgroundColor = .systemGreen
        
        // Shadow effect
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.5
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowRadius = 4
        // cell corner radius and borderWidth
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 1
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 20
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedInfo = info[indexPath.row]
        let detailViewController = DetailViewController(info: selectedInfo)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let info = info[indexPath.row].appStoreURL  
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
                let share = UIAction(title: "Share", image: UIImage(systemName: "arrow.uturn.forward"), handler: { _ in
                    let appURL = info // Replace with your app's URL
                    let activityViewController = UIActivityViewController(activityItems: [appURL], applicationActivities: nil)
                    self.present(activityViewController, animated: true, completion: nil)
                })
                
                return UIMenu(title: "", children: [share])
            }
            
            return configuration
    }

}
