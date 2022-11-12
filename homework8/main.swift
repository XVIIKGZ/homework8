//
//  main.swift
//  homework8
//
//  Created by Nazar Kydyraliev on 12/11/22.
//

import Foundation

var warrior = 1000, warriorAttack = 200, warriorDamage = 0 // Воин, 1000 ХП у него, 200 ХП аттаки, счётчик урона
var witch = 1000, witchAttack = 300, witchDamage = 0 // Колдун, 1000 ХП у него, 300 ХП атаки, счётчик урона
var medic = 1000, medicHelp = 200, medicHeal = 0 // Медик, 1000 ХП у него, 200 ХП восполняет каждые два раунда, счётчик хэлпы
var defender = 1500, defenderAttack = 100, defenderDamage = 0 // Зашитник, 1500 ХП у него, 100 ХП аттаки, счётчик урона

var boss = 5000, bossAttack = 200 // Босс, 5000 ХП у него, 200 ХП аттаки каждому

var hpAll = 0

var countRound: Int = 1

func attack(){
    print("\n*** \(countRound) раунд ***")
    countRound += 1
    print("\nГерои атакуют:")
    if warrior > 0 {
        boss -= warriorAttack
        print("Воин нанес \(warriorAttack) урона БОССУ. ХП БОССА - \(boss)")
        warriorDamage += warriorAttack
    }
    if witch > 0 {
        boss -= witchAttack
        print("Колдун нанес \(witchAttack) урона БОССУ. ХП БОССА - \(boss)")
        witchDamage += witchAttack
    }
    if defender > 0 {
        boss -= defenderAttack
        print("Защитник нанес \(defenderAttack) урона БОССУ. ХП БОССА - \(boss)")
        defenderDamage += defenderAttack
    }
    
    print("\nБосс атакует:")
    if warrior > 0 {
        warrior -= bossAttack
        print("ХП героя Воина - \(warrior)")
    }
    if witch > 0 {
        witch -= bossAttack
        print("ХП героя Колдуна - \(witch)")
    }
    if medic > 0 {
        medic -= bossAttack
        print("ХП героя Медика - \(medic)")
    }
    if defender > 0 {
        defender -= bossAttack
        print("ХП героя Защитника - \(defender)\n")
    }
    print("---------------------------------------------------------------")
    
        if countRound % 2 == 1{
            if medic > 0{
                print("\nМедик дал жизни героям:")
                if warrior > 0 {
                    warrior += medicHelp
                    print("Воин получил \(medicHelp), ХП героя \(warrior)")
                    medicHeal += medicHelp
                }
                if witch > 0 {
                    witch += medicHelp
                    print("Колдун получил \(medicHelp), ХП героя \(witch)")
                    medicHeal += medicHelp
                }
                if defender > 0 {
                    defender += medicHelp
                    print("Защитник получил \(medicHelp), ХП героя \(defender)")
                    medicHeal += medicHelp
                }
                print("\n---------------------------------------------------------------")
            }
        }
}

for _ in 0...1000000{
    hpAll = warrior + witch + medic + defender
    if hpAll >= 0 || boss >= 0 {
        attack()
    }
    if hpAll <= 0 || boss <= 0 {
        break
    }

}

print("""
\nПрошло - \(countRound - 1) раундов
Воин нанес - \(warriorDamage) урона
Колдун нанес - \(warriorDamage) урона
Медик восполнил - \(medicHeal) ХП
Защитник нанес - \(defenderDamage) урона
""")

if boss > hpAll {
    print("\nПобедил БОСС")
} else {
    print("\nПобедили герои")
}
