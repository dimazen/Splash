//
// Command.swift
// Created by Dima Vorona
//

import Foundation

public final class Command<T> {
  
  private let function: (T) -> Void
  
  init(_ function: @escaping (T) -> Void) {
    self.function = function
  }
}
