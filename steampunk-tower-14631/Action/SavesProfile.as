package 
{

    public class SavesProfile extends Object
    {
        public var active:Boolean = false;
        public var levelIndex:int = 0;
        public var scores:Array;
        public var scoresChallenge:Array;
        public var upgrTowerIndex:int = 0;
        public var upgrMachineGunIndex:int = 0;
        public var upgrHeavyGunIndex:int = 0;
        public var upgrLightningIndex:int = 0;
        public var upgrSawsIndex:int = 0;
        public var stars:Array;
        public var challenge:Array;
        public var enemyIsShow:Array;
        public var helpUpgShows:Boolean = false;
        public var helpReloadShows:Boolean = false;
        public var isCannonUpgrade:Boolean = false;
        public var buyHeavygun:Boolean = false;
        public var buyLightning:Boolean = false;
        public var buySaw:Boolean = false;
        public var achivGetted:Array;
        public var enemiesCount:int = 0;
        public var enemiesCountSplash:int = 0;
        public var enemiesCountChain:int = 0;
        public var enemiesCountCrit:int = 0;
        public var enemiesCountBirds:int = 0;

        public function SavesProfile()
        {
            this.scores = new Array();
            this.scoresChallenge = new Array();
            this.stars = new Array();
            this.challenge = new Array();
            this.enemyIsShow = new Array();
            this.achivGetted = new Array();
            this.clear();
            return;
        }// end function

        public function get totalStars() : int
        {
            var _loc_1:int = 0;
            var _loc_2:int = 0;
            while (_loc_2 < 15)
            {
                
                _loc_1 = _loc_1 + (this.stars[_loc_2] + this.challenge[_loc_2]);
                _loc_2++;
            }
            return _loc_1;
        }// end function

        public function loadFromObject(param1:Object) : void
        {
            if (param1.active != undefined)
            {
                this.active = param1.active;
            }
            if (param1.levelIndex != undefined)
            {
                this.levelIndex = Utilites.clamp(param1.levelIndex, 0, (Main.totalLevels - 1));
            }
            if (param1.upgrTowerIndex != undefined)
            {
                this.upgrTowerIndex = param1.upgrTowerIndex;
            }
            if (param1.upgrMachineGunIndex != undefined)
            {
                this.upgrMachineGunIndex = param1.upgrMachineGunIndex;
            }
            if (param1.upgrHeavyGunIndex != undefined)
            {
                this.upgrHeavyGunIndex = param1.upgrHeavyGunIndex;
            }
            if (param1.upgrLightningIndex != undefined)
            {
                this.upgrLightningIndex = param1.upgrLightningIndex;
            }
            if (param1.upgrSawsIndex != undefined)
            {
                this.upgrSawsIndex = param1.upgrSawsIndex;
            }
            if (param1.stars != undefined)
            {
                this.stars = param1.stars;
            }
            if (param1.challenge != undefined)
            {
                this.challenge = param1.challenge;
            }
            if (param1.helpUpgShows != undefined)
            {
                this.helpUpgShows = param1.helpUpgShows;
            }
            if (param1.helpReloadShows != undefined)
            {
                this.helpReloadShows = param1.helpReloadShows;
            }
            if (param1.isCannonUpgrade != undefined)
            {
                this.isCannonUpgrade = param1.isCannonUpgrade;
            }
            if (param1.enemyIsShow != undefined)
            {
                this.enemyIsShow = param1.enemyIsShow;
            }
            if (param1.buyHeavygun != undefined)
            {
                this.buyHeavygun = param1.buyHeavygun;
            }
            if (param1.buyLightning != undefined)
            {
                this.buyLightning = param1.buyLightning;
            }
            if (param1.buySaw != undefined)
            {
                this.buySaw = param1.buySaw;
            }
            if (param1.achivGetted != undefined)
            {
                this.achivGetted = param1.achivGetted;
            }
            if (param1.enemiesCount != undefined)
            {
                this.enemiesCount = param1.enemiesCount;
            }
            if (param1.enemiesCountSplash != undefined)
            {
                this.enemiesCountSplash = param1.enemiesCountSplash;
            }
            if (param1.enemiesCountChain != undefined)
            {
                this.enemiesCountChain = param1.enemiesCountChain;
            }
            if (param1.enemiesCountCrit != undefined)
            {
                this.enemiesCountCrit = param1.enemiesCountCrit;
            }
            if (param1.enemiesCountBirds != undefined)
            {
                this.enemiesCountBirds = param1.enemiesCountBirds;
            }
            if (param1.scores != undefined)
            {
                this.scores = param1.scores;
            }
            if (param1.scoresChallenge != undefined)
            {
                this.scoresChallenge = param1.scoresChallenge;
            }
            return;
        }// end function

        public function clear() : void
        {
            this.levelIndex = 0;
            this.upgrTowerIndex = 0;
            this.upgrMachineGunIndex = 0;
            this.upgrHeavyGunIndex = 0;
            this.upgrLightningIndex = 0;
            this.upgrSawsIndex = 0;
            var _loc_1:int = 0;
            while (_loc_1 < 15)
            {
                
                this.stars[_loc_1] = 0;
                this.challenge[_loc_1] = 0;
                this.scores[_loc_1] = 0;
                this.scoresChallenge[_loc_1] = 0;
                _loc_1++;
            }
            this.helpUpgShows = false;
            this.helpReloadShows = false;
            this.isCannonUpgrade = false;
            this.buyHeavygun = false;
            this.buyLightning = false;
            this.buySaw = false;
            this.enemyIsShow[0] = true;
            _loc_1 = 1;
            while (_loc_1 < 17)
            {
                
                this.enemyIsShow[_loc_1] = false;
                _loc_1++;
            }
            _loc_1 = 0;
            while (_loc_1 < 18)
            {
                
                this.achivGetted[_loc_1] = false;
                _loc_1++;
            }
            this.enemiesCount = 0;
            this.enemiesCountSplash = 0;
            this.enemiesCountChain = 0;
            this.enemiesCountCrit = 0;
            this.enemiesCountBirds = 0;
            return;
        }// end function

        public function totalScore() : int
        {
            var _loc_1:int = 0;
            var _loc_2:int = 0;
            while (_loc_2 < 15)
            {
                
                _loc_1 = _loc_1 + this.scoresChallenge[_loc_2];
                _loc_1 = _loc_1 + this.scores[_loc_2];
                _loc_2++;
            }
            return _loc_1;
        }// end function

    }
}
