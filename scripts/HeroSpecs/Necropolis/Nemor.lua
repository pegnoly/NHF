----------------Дейдра-------------------------
nemor_spec =
{
    
}

function  error_NHF_Nemor_F ()
	print("error:NHF_Nemor_F");
end;

AddEvent(add_hero_events, 'NHF_nemor_add_hero',
function(hero)
    if GetHeroSpec(hero) == HERO_SPEC_DARK_EMISSARY then
        startThread(
        function()
        while 1 do
            if IsHeroAlive(%hero) then
                errorHook(error_NHF_Nemor_F)
                local stack_count = len(table.pack(GetObjectCreaturesTypes(%hero)))
                local wight_count = GetHeroCreatures(%hero, CREATURE_WIGHT)
                if wight_count > 0 then
                    if stack_count == 1 then
                        AddHeroCreatures(hero, CREATURE_SKELETON, 1)
                        while GetHeroCreatures(hero, CREATURE_SKELETON) ~= 1 do
                            sleep()
                        end
                        AddCreatures(CREATURE_WIGHT, %hero, -wight_count)
                        sleep()
                        AddCreatures(CREATURE_BANSHEE, %hero, wight_count)
                        RemoveHeroCreatures(%hero, CREATURE_SKELETON, 1)
                    else
                        AddCreatures(CREATURE_WIGHT, %hero, -wight_count)
                        sleep()
                        AddCreatures(CREATURE_BANSHEE, %hero, wight_count)
                    end
                end
            end
            sleep()
        end
    end
end)