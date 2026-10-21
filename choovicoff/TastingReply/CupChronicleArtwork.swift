//
//  CupChronicleArtwork.swift
//  choovicoff
//
//  Created by choovicoff on 2026/10/21.
//

import UIKit

class CupChronicleArtwork: UIView {
  let uviaSignupTrailRow = UIButton(type: .system)

  private let cckuiCalmGatheringStack = UIImageView()
  private let vieNordicGroveMark = UIActivityIndicatorView(style: .large)
  private let uviaForestCircleTitleLabel = UILabel()
  private let vieQuietTrailSubcckuiRosterTitleLabel = UIStackView()

  override init(frame vieFieldBox: CGRect) {
    super.init(frame: vieFieldBox)
    backgroundColor = UIColor(red: 4 / 255, green: 3 / 255, blue: 19 / 255, alpha: 1)
    cckuiCalmGatheringStack.contentMode = .scaleAspectFill
    cckuiCalmGatheringStack.clipsToBounds = true
    cckuiCalmGatheringStack.translatesAutoresizingMaskIntoConstraints = false
    addSubview(cckuiCalmGatheringStack)

   
    vieNordicGroveMark.color = .white
    vieNordicGroveMark.hidesWhenStopped = true
    uviaForestCircleTitleLabel.textColor = .white
      uviaForestCircleTitleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
    uviaForestCircleTitleLabel.textAlignment = .center
    uviaForestCircleTitleLabel.numberOfLines = 0
    uviaSignupTrailRow.setTitle("Quick Login", for: .normal)
    uviaSignupTrailRow.setTitleColor(.white, for: .normal)
    uviaSignupTrailRow.setTitleColor(UIColor.white.withAlphaComponent(0.65), for: .disabled)
    uviaSignupTrailRow.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
      uviaSignupTrailRow.backgroundColor = UIColor.orange
    uviaSignupTrailRow.layer.cornerRadius = 16
    for vieJoinForestPlanRow in [vieNordicGroveMark, uviaForestCircleTitleLabel, uviaSignupTrailRow] {
      vieQuietTrailSubcckuiRosterTitleLabel.addArrangedSubview(vieJoinForestPlanRow)
    }
    vieQuietTrailSubcckuiRosterTitleLabel.axis = .vertical
    vieQuietTrailSubcckuiRosterTitleLabel.alignment = .center
    vieQuietTrailSubcckuiRosterTitleLabel.spacing = 16
    vieQuietTrailSubcckuiRosterTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    addSubview(vieQuietTrailSubcckuiRosterTitleLabel)

    let vieForestPaceLabel = uviaSignupTrailRow.heightAnchor.constraint(equalToConstant: 52)
    vieForestPaceLabel.priority = UILayoutPriority(999)
    NSLayoutConstraint.activate([
      cckuiCalmGatheringStack.topAnchor.constraint(equalTo: topAnchor),
      cckuiCalmGatheringStack.bottomAnchor.constraint(equalTo: bottomAnchor),
      cckuiCalmGatheringStack.leadingAnchor.constraint(equalTo: leadingAnchor),
      cckuiCalmGatheringStack.trailingAnchor.constraint(equalTo: trailingAnchor),
      vieQuietTrailSubcckuiRosterTitleLabel.leadingAnchor.constraint(
        equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 32),
      vieQuietTrailSubcckuiRosterTitleLabel.trailingAnchor.constraint(
        equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -32),
      vieQuietTrailSubcckuiRosterTitleLabel.topAnchor.constraint(
        greaterThanOrEqualTo: safeAreaLayoutGuide.topAnchor, constant: 16),
      vieQuietTrailSubcckuiRosterTitleLabel.bottomAnchor.constraint(
        equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -80),
    
      uviaForestCircleTitleLabel.widthAnchor.constraint(equalTo: vieQuietTrailSubcckuiRosterTitleLabel.widthAnchor),
      uviaSignupTrailRow.widthAnchor.constraint(equalTo: vieQuietTrailSubcckuiRosterTitleLabel.widthAnchor),
      vieForestPaceLabel,
    ])
  }

  required init?(coder vieCanopyGrabber: NSCoder) { nil }

  func uviaSignupTrailButton(cckuiOpenForestAccessResult: Bool, uviaForestJournalScrollView: Bool) {
    cckuiCalmGatheringStack.image = UIImage(
      named: cckuiOpenForestAccessResult
        ? BeanPassportStack.nordvikaWildsaura
        : BeanPassportStack.nordvikaCedarnora
    )
    vieQuietTrailSubcckuiRosterTitleLabel.isHidden = !cckuiOpenForestAccessResult
    uviaSignupTrailRow.isHidden = !uviaForestJournalScrollView
  }

  func cckuiForestJournalRefresh(_ vieGreenSquareContentView: Bool, uviaForestStewardHeaderView: String? = nil) {
    uviaSignupTrailRow.isEnabled = !vieGreenSquareContentView
    uviaSignupTrailRow.alpha = vieGreenSquareContentView ? 0.55 : 1
    uviaForestCircleTitleLabel.text = uviaForestStewardHeaderView ?? (vieGreenSquareContentView ? "Connecting…" : nil)
    if vieGreenSquareContentView {
      vieNordicGroveMark.startAnimating()
    } else {
      vieNordicGroveMark.stopAnimating()
    }
  }
}
