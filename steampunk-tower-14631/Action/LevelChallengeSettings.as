package 
{

    public class LevelChallengeSettings extends Object
    {
        public static var isChallenge:Boolean = false;
        public static var towerLevel:int;
        public static var towerHealth:int;
        public static var globalUpgrades:int;
        public static var maxCannons:int;
        public static var machinegun:Boolean;
        public static var heavygun:Boolean;
        public static var lightning:Boolean;
        public static var saws:Boolean;

        public function LevelChallengeSettings()
        {
            return;
        }// end function

        public static function reset() : void
        {
            isChallenge = false;
            towerLevel = 2;
            maxCannons = 200;
            machinegun = true;
            heavygun = true;
            lightning = true;
            saws = true;
            return;
        }// end function

    }
}
