```mermaid
---
config:
  theme: redux
  layout: elk
---
classDiagram
direction RL
    class RPGSystem {
        <<enumeration>>
        LANCER
        DND5E
        ORDEM_PARANORMAL
    }

    class Campaign {
	    -name : string
        -cover : ActiveStorage::Attached::One
	    -system : RPGSystem
        -active : boolean
    }

    note for Campaign "
Campaign.system = LANCER
⇒ Character dev  e ser LancerCharacter

Campaign.system = DND5E
⇒ Character deve ser DndCharacter

Campaign.system = ORDEM_PARANORMAL
⇒ Character deve ser OrdemParanormalCharacter
    "

    class User {
        -name : string
	    -email : string
        -uid : string
        -provider : string
        -portrait : ActiveStorage::Attached::One
        -active : boolean
    }

    class UserCampaign {
        -lastVisited : datetime?
    }

    class Character {
        -system : string
	    -name : string
        -portrait : ActiveStorage::Attached::One
	    -color : string?
	    -flavor : string?
	    -createdAt : date
        -active : boolean
    }

    class LancerCharacter {
	    -frameModel : string?
	    -frameName : string?
	    -codename : string?
	    -totalPilotHp : int
	    -currentPilotHp : int
	    -totalStructure : int
        -currentStructure : int
	    -totalFrameHp : int
	    -currentFrameHp : int
	    -totalReactor : int
	    -currentReactor : int
	    -heatCap : int
	    -currentHeat : int
    }

    class DndCharacter {
	    -totalHp : int
	    -currentHp : int
    }

    class OrdemParanormalCharacter {
        -resource : string
	    -totalHp : int
	    -currentHp : int
        -totalSanity : int?
        -currentSanity : int?
	    -totalPe : int?
	    -currentPe : int?
	    -totalPd : int?
	    -currentPd : int?
    }

    Campaign ..> RPGSystem
    User "1" --> "0..*" UserCampaign
    Campaign "1" --> "0..*" UserCampaign
    User "1" <-- "0..*" Character
    Campaign "1" <-- "0..*" Character
    LancerCharacter --|> Character
    OrdemParanormalCharacter --|> Character
    DndCharacter --|> Character
```