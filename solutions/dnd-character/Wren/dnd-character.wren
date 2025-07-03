import "random" for Random

class Util {
  static abilityModifier(score) {
    if (score < 3) Fiber.abort("Ability scores must be at least 3")
    if (score > 18) Fiber.abort("Ability scores can be at most 18")
    return ((score - 10) / 2).floor
  }
}

class Character {
  static rollAbility() {
    var dice = Random.new()
    return (1..4).map{dice.int(1,7)}
      .toList.sort()[1..3]
      .reduce{|a,b| a+b}
  }

  construct new() {
    _cha = Character.rollAbility()
    _con = Character.rollAbility()
    _dex = Character.rollAbility()
    _int = Character.rollAbility()
    _str = Character.rollAbility()
    _wis = Character.rollAbility()
  }

  charisma { _cha }
  constitution { _con }
  dexterity { _dex  }
  intelligence { _int }
  strength { _str  }
  wisdom { _wis }


  hitpoints { 10 + Util.abilityModifier(constitution) }
}