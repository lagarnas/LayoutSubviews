//
//  RedView.swift
//  LayoutSubviews vc layoutIfNeeded
//
//  Created by Анастасия Леонтьева on 20.11.2020.
//

import UIKit

class RedView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .red
    translatesAutoresizingMaskIntoConstraints = false
    
  }
  
  //Обрабатывает перемещения и изменения вью исвсех его сабвьювс. Это дает текущему вью и сабвьювс метосположение и размер
  
  // Очень энергозатратный медод, он действует на все сабвью у данного вью и вызывает их соответствующие layoutSubviews() методы тоже
  override func layoutSubviews() {
    super.layoutSubviews()
    //система вызвает этот метод всякий раз когда надо пересчитать фреймы у вью
    self.layer.cornerRadius = self.frame.width / 2
    self.layer.shadowRadius = 9
    self.layer.shadowOpacity = 1
    self.layer.shadowOffset  = CGSize(width: 5, height: 8)
    self.clipsToBounds = false
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
