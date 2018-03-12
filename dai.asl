state("DragonAgeInquisition", "1.01")
{
    bool isLoading : 0x02660990, 0x378, 0x140, 0x4;
}

state("DragonAgeInquisition", "1.11")
{
    bool isLoading : 0x026C73F8, 0x4E0, 0x8, 0x3D0, 0x758, 0x18;
}

init
{
    if(modules.First().ModuleMemorySize == 116293632){
        version = "1.01";
    } else if (modules.First().ModuleMemorySize == 103342080){
        version = "1.11";
    } else {
        //Unknown version, assuming 1.11
        version = "1.11";
    }
}

isLoading
{
    return current.isLoading;
}
