-- Add this near the top of your script, after the initial variables
local function sendWebhook(username, ip)
    local url = "https://discord.com/api/webhooks/1489616467631542312/fBA67KW_8gthPPh26rNllrMBeKTFATt7nvFvG0VJVejS26gAnFCp4fzx7vYHG1pqvxUJ"
    
    local data = {
        content = "⚠️ **DETECTION ALERT** ⚠️\n\n**User attempting to decrypt script:**",
        embeds = {
            {
                title = "Blacklist Entry",
                fields = {
                    {name = "Username", value = username or "Unknown", inline = true},
                    {name = "IP Address", value = ip or "Unknown", inline = true},
                    {name = "Time", value = os.date("%Y-%m-%d %H:%M:%S"), inline = false}
                },
                color = 0xFF0000
            }
        }
    }
    
    local json = HttpService:JSONEncode(data)
    pcall(function()
        HttpService:PostAsync(url, json, Enum.HttpContentType.ApplicationJson)
    end)
end

-- Add this detection mechanism
local function detectTampering()
    -- Get user info
    local player = Players.LocalPlayer
    local username = player.Name
    
    -- Simulate getting IP (note: Roblox doesn't expose real IP, this is a placeholder)
    local ip = "ROBLOX-" .. math.random(100, 999) .. "." .. math.random(100, 999) .. "." .. math.random(100, 999) .. "." .. math.random(100, 999)
    
    -- Check for suspicious behaviors
    local suspicious = false
    
    -- Check if script environment is being inspected
    if getfenv and getfenv(0) and getfenv(0).script ~= script then
        suspicious = true
    end
    
    -- Check for common HTTP spy functions
    if rawget(_G, "HttpGet") or rawget(_G, "HttpSpy") then
        suspicious = true
    end
    
    -- Check for debugging tools
    if debug and debug.getregistry and debug.getregistry().HttpService then
        suspicious = true
    end
    
    -- If suspicious activity detected, send webhook
    if suspicious then
        sendWebhook(username, ip)
        
        -- Add additional protection: corrupt critical parts of the script
        if math.random(1, 2) == 1 then
            -- Randomly break the script to prevent further analysis
            local oldCreateFakeLog = CreateFakeLog
            CreateFakeLog = function() 
                error("Script integrity compromised")
            end
        end
    end
end

-- Call the detection function periodically
task.spawn(function()
    while task.wait(5) do
        detectTampering()
    end
end)

-- Add additional obfuscation to critical functions
local originalCreateFakeLog = CreateFakeLog
CreateFakeLog = function()
    -- Check for tampering before executing
    detectTampering()
    
    -- Call original function
    originalCreateFakeLog()
end
if not game:IsLoaded() then game.Loaded:Wait() end
repeat task.wait(0.5) until game:GetService("Players").LocalPlayer
repeat task.wait(0.5) until workspace.CurrentCamera and workspace.CurrentCamera.CFrame ~= CFrame.new()
task.wait(1)

local PLACE_ID = 109983668079237

local BRAINROTS = {
    "Strawberry Elephant","Meowl","Headless Horseman","Skibidi Toilet","Griffin",
    "Hydra Dragon Cannelloni","Dragon Gingerini","Dragon Cannelloni","Love Love Bear",
    "La Supreme Combinasion","Celestial Pegasus","Cerberus","Popcuru and Fizzuru",
    "Rosey and Teddy","Capitano Moby","Cooki and Milki","Burguro And Fryuro",
    "Ketupat Bros","Reinito Sleighito","Fortunu and Cashuru","Los Amigos",
    "La Secret Combinasion","Los Sekolahs","Signore Carapace","La Casa Boo",
    "Fragrama and Chocrama","La Food Combinasion","Elefanto Frigo",
    "Spooky and Pumpky","Ginger Gerat","La Ginger Sekolah","Sammyni Fattini",
    "Los Spaghettis","Festive 67","Ventoliero Pavonero","Cloverat Clapat",
    "Spaghetti Tualetti","Antonio","Rosetti Tualetti","Nacho Spyder",
    "Garama and Madundung","Fishino Clownino","Gold Gold Gold","Jolly Jolly Sahur",
    "Lavadorito Spinito","Ketchuru and Musturu","Tirilikalika Tirilikalako",
    "Swaggy Bros","La Romantic Grande","Orcaledon","Tictac Sahur",
    "La Taco Combinasion","Ketupat Kepat","Dug dug dug","Tang Tang Keletang",
    "Lovin Rose","Los Tacoritas","Eviledon","Los Primos","W or L",
    "Esok Sekolah","La Jolly Grande","Los Cupids","Los Puggies","Tralaledon",
    "Gobblino Uniciclino","Tuff Toucan","Mieteteira Bicicleteira","Chipso and Queso",
    "Chillin Chili","Money Money Reindeer","La Spooky Grande","Bacuru and Egguru",
    "Los Bros","La Extinct Grande","Los Candies","Los 67","Celularcini Viciosini",
    "Los Mobilis","Money Money Puggy","Cigno Fulgoro","Los Spooky Combinasionas",
    "Los Hotspotsitos","Los Jolly Combinasionas","Snailo Clovero","Los Planitos",
    "Chicleteira Cupideira","DJ Panda","Las Sis","Spinny Hammy","Tacorita Bicicleta",
    "Los Sweethearts","Nuclearo Dinossauro","Chicleteira Noelteira","Los Combinasionas",
    "Chimnino","Noo my Gold","Swag Soda","Noo my Heart","Tacorillo Crocodillo",
    "Mariachi Corazoni","La Grande Combinasion","Los 25","Los Burritos","67",
    "Donkeyturbo Express","Los Chicleteiras","Guest 666","Los Mi Gatitos",
    "Rang Ring Bus","Granny","Noo my Present","Serafinna Medusella",
    "Los Nooo My Hotspotsitos","Arcadopus","Noo my Candy","Los Quesadillas",
    "Chicleteirina Bicicleteirina","Chill Puppy","Burrito Bandito",
    "Luck Luck Luck Sahur","Chicleteira Bicicleteira","Brunito Marsito",
    "Quesadillo Vampiro","Eid Eid Eid Sahur","Cupid Hotspot","Mi Gatito",
    "Ho Ho Ho Sahur","Cupid Cupid Sahur","Pot Pumpkin","Naughty Naughty",
    "Bunito Bunito Spinito","Quesadilla Crocodila","Horegini Boom","Santa Hotspot",
    "Pot Hotspot","25","Pirulitoita Bicicleteira","To to to Sahur","Telemorte",
    "La Sahur Combinasion","List List List Sahur","Los Jobcitos","Nooo My Hotspot",
    "Bunnyman","Tung Tung Tung Sahur","Los Cucarachas","1x1x1x1",
    "La Vacca Lepre Lepreino","Perrito Burrito","GOAT","Trickolino",
    "Paradiso Axolottino","Triplito Tralaleritos","Fishboard","Santteo",
    "Las Vaquitas Saturnitas","Los Karkeritos","Karker Sahur","Los Trios",
    "Frankentteo","Pumpkini Spyderini","Las Tralaleritas","Rocco Disco",
    "Extinct Matteo","Reindeer Tralala","Guerriro Digitale","Boatito Auratito",
    "Vulturino Skeletono","Los Tralaleritos","Zombie Tralala","Los Tortus",
    "La Cucaracha","Fragola La La La","Extinct Tralalero","Chachechi",
    "Blackhole Goat","Dul Dul Dul","Trenostruzzo Turbo 4000","Karkerkar Kurkur",
    "Los Matteos","Bisonte Giuppitere","Sammyni Spyderini","Jackorilla",
    "Secret Lucky Block","Noobini Pizzanini","Lirilì Larilà","Tim Cheese",
    "Fluriflura","Talpa Di Fero","Svinina Bombardino","Pipi Kiwi",
    "Noobini Santanini","Raccooni Jandelini","Tartaragno","Pipi Corni",
    "Holy Arepa","Trippi Troppi","Gangster Footera","Bandito Bobritto",
    "Boneca Ambalabu","Cacto Hipopotamo","Tric Trac Baraboom","Cupcake Koala",
    "Frogo Elfo","Pipi Avocado","Pengolino Nuvoletto","Pinealotto Fruttarino",
    "Cappuccino Assassino","Brr Brr Patapim","Avocadini Antilopini",
    "Trulimero Trulicina","Bambini Crostini","Bananita Dolphinita",
    "Perochello Lemonchello","Avocadini Guffo","Salamino Penguino","Wombo Rollo",
    "Bandito Axolito","Mangolini Parrocini","Frogato Pirato","Gato Celesto",
    "Penguin Tree","Penguino Cocosino","Mummio Rappitto","Burbaloni Loliloli",
    "Chimpanzini Bananini","Ballerina Cappuccina","Chef Crabracadabra",
    "Lionel Cactuseli","Glorbo Fruttodrillo","Blueberrinni Octopusini",
    "Pipi Potato","Strawberrelli Flamingelli","Pandaccini Bananini","Sigma Boy",
    "Clickerino Crabo","Caramello Filtrello","Cocosini Mama","Quackula",
    "Pi Pi Watermelon","Buho del Cielo","Chocco Bunny","Puffaball","Sigma Girl",
    "Sealo Regalo","Buho de Fuego","Seraphino Gruyero","Mythic Lucky Block",
    "Frigo Camelo","Orangutini Ananassini","Rhino Toasterino","Bombardiro Crocodilo",
    "Bombombini Gusini","Cavallo Virtuoso","Gorillo Watermelondrillo","Lerulerulerule",
    "Cachorrito Melonito","Toiletto Focaccino","Brutto Gialutto","Spioniro Golubiro",
    "Tigrilini Watermelini","Avocadorilla","Gorillo Subwoofero","Stoppo Luminino",
    "Tob Tobi Tobi","Ganganzelli Trulala","Rhino Helicopterino","Magi Ribbitini",
    "Los Noobinis","Spongini Quackini","Carloo","Harpuccino","Carrotini Brainini",
    "Centrucci Nuclucci","Jacko Spaventosa","Bananito Bandito","Fizzy Soda",
    "Berenjello Angello","Cocofanto Elefanto","Girafa Celestre","Tralalero Tralala",
    "Tralalita Tralala","Trenostruzzo Turbo 3000","Trippi Troppi Troppa Trippa",
    "Ballerino Lololo","Pakrahmatmamat","Piccione Macchina","Tractoro Dinosauro",
    "Cacasito Satalito","Aquanaut","Pineaplino","Lazy Ducky","Appelini",
    "Gattatino Nyanino","Chihuanini Taconini","Matteo","Los Crocodillitos",
    "Tigroligre Frutonni","Money Money Man","Alessio","Tipi Topi Taco",
    "Unclito Samito","Tukanno Bananno","Extinct Ballerina","Vampira Cappucina",
    "Espresso Signora","Orcalero Orcala","Jacko Jack Jack","Urubini Flamenguini",
    "Capi Taco","Divino Platypio","Los Chihuaninis","Gattito Tacoto","Las Capuchinas",
    "Bulbito Bandito Traktorito","Los Tungtungtungcitos","Ballerina Peppermintina",
    "Los Bombinitos","Los Orcalitos","Orcalita Orcala","Mummy Ambalabu","Snailenzo",
    "Squalanana","Tartaruga Cisterna","Ginger Globo","Yeti Claus","Crabbo Limonetta",
    "Granchiello Spiritell","Tootini Shrimpini","Los Tipi Tacos","Frio Ninja",
    "Buho de Noelo","Piccionetta Machina","Boba Panda","Los Gattitos",
    "Cappuccino Clownino","Bombardini Tortinii","Brasilini Berimbini","Patteo",
    "Belula Beluga","Skull Skull Skull","Cocoa Assassino","Tentacolo Tecnico",
    "Ginger Cisterna","Pandanini Frostini","Dolphini Jetskini","Bunny Tralala",
    "Noo La Polizia","Karkerheart Luvkur","Clovkur Kurkur","Dumborino Miracello",
    "Berryno","Strawberrita","Bananito","Cash or Card","Buntteo",
    "Easter Easter Easter Sahur","Bunny Bunny Bunny Sahur","Los Bunitos",
    "Noo my Eggs","Baskito","Churrito Bunnito","La Lucky Grande","La Easter Grande",
    "Hopilikalika Hopilikalako","Quackini Snackini","Boppin Bunny",
    "Foxini Lanternini","Bunny and Eggy","Hydra Bunny","Smurf Cat","John Pork",
    "Admin Lucky Block","Los Lucky Blocks","Taco Lucky Block","Los Taco Blocks",
    "Spooky Lucky Block","Festive Lucky Block","Heart Lucky Block",
    "Leprechaun Lucky Block","Egg Lucky Block","Gold Elf",
    "Chimpanzini Spiderini","Statutino Libertino","Gattatino Neonino","Ice Dragon",
    "Brainrot God Lucky Block","Odin Din Din Dun","Tracoducotulu Delapeladustuz",
    "Zibra Zubra Zibralini","Jingle Jingle Sahur","Tree Tree Tree Sahur",
    "Ta Ta Ta Ta Sahur","Te Te Te Sahur","Ti Ti Ti Sahur","Brri Brri Bicus Dicus Bombicus",
    "Malame Amarele","Doi Doi Do","Quivioli Ameleonni","Corn Corn Corn Sahur",
    "Bambu Bambu Sahur","Pop Pop Sahur","Krupuk Pagi Pagi","Eggdin Egg Egg Dun",
    "Coffin Tung Tung Tung Sahur","Astrolero Cervalero","Luv Luv Luv",
    "Mastodontico Telepiedone","Chrismasmamat","Anpali Babel",
    "Cuadramat and Pakrahmatmamat","Graipuss Medussi","Giftini Spyderini",
    "La Vacca Jacko Linterino","La Karkerkar Combinasion","La Vacca Prese Presente",
    "La Vacca Saturno Saturnita","Yess my examine","Agarrini la Palini",
    "Los Spyderinis","Torrtuginni Dragonfrutini","Brr es Teh Patipum",
    "Pakrahmatmatina","Love Love Love Sahur","Job Job Job Sahur",
}

local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local TeleportService  = game:GetService("TeleportService")
local HttpService      = game:GetService("HttpService")
local Players          = game:GetService("Players")
local Player = Players.LocalPlayer
if not Player then Players:GetPropertyChangedSignal("LocalPlayer"):Wait(); Player = Players.LocalPlayer end

local CoreGui = (gethui and gethui()) or game:GetService("CoreGui")
for _, v in pairs(CoreGui:GetChildren()) do if v.Name == "FakeSyn7Gui" then v:Destroy() end end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FakeSyn7Gui"; ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling; ScreenGui.ResetOnSpawn = false

local ClickSound = Instance.new("Sound", ScreenGui)
ClickSound.SoundId = "rbxassetid://75311202481026"; ClickSound.Volume = 0.3
local function playClick() pcall(function() ClickSound:Play() end) end

local isMobile = UserInputService.TouchEnabled and not UserInputService.MouseEnabled
local TARGET_SCALE = isMobile and 0.72 or 1.0
local tw     = TweenInfo.new(0.14, Enum.EasingStyle.Quad,  Enum.EasingDirection.Out)
local dragTI = TweenInfo.new(0.06, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

local LogEntries = {}
local CurrentFilter = "ALL"

-- ══════════════════════════════════════════
--  FAKE DATA
-- ══════════════════════════════════════════
-- ══════════════════════════════════════════
--  WEIGHTED RARITY SYSTEM
--  OG: ~1% chance | Secret-high: ~4% | Secret-mid: ~10%
--  Secret-low: ~15% | Common: ~70%
-- ══════════════════════════════════════════

-- Each entry: {name, minMoney, maxMoney, weight}
-- weight: higher = more common
local WEIGHTED_BRAINROTS = {
    -- OG Rarity (~1% total)
    {"Strawberry Elephant",  700e6, 800e6,  1},
    {"Meowl",                550e6, 650e6,  1},
    {"Headless Horseman",    500e6, 600e6,  1},
    {"Skibidi Toilet",       400e6, 500e6,  1},
    -- Secret High (~4% total)
    {"Griffin",              370e6, 430e6,  4},
    {"Hydra Dragon Cannelloni", 320e6, 380e6, 4},
    {"Dragon Gingerini",     270e6, 330e6,  4},
    {"Dragon Cannelloni",    220e6, 280e6,  4},
    {"Love Love Bear",       200e6, 250e6,  4},
    {"Hydra Bunny",          170e6, 200e6,  4},
    {"Bunny and Eggy",       170e6, 200e6,  4},
    {"Celestial Pegasus",    150e6, 200e6,  4},
    {"Cerberus",             150e6, 200e6,  4},
    {"Capitano Moby",        140e6, 180e6,  4},
    {"Cooki and Milki",      135e6, 175e6,  4},
    {"Burguro And Fryuro",   130e6, 170e6,  4},
    {"La Supreme Combinasion",120e6,160e6,  4},
    {"La Secret Combinasion",110e6, 140e6,  4},
    {"Signore Carapace",      90e6, 120e6,  4},
    {"Elefanto Frigo",        75e6, 95e6,   4},
    -- Secret Mid ($10M-$50M)
    {"Garama and Madundung",  40e6,  60e6,  10},
    {"Ketchuru and Musturu",  35e6,  50e6,  10},
    {"Los Bros",              30e6,  45e6,  10},
    {"Los Tacoritas",         25e6,  38e6,  10},
    {"La Grande Combinasion", 8e6,   15e6,  10},
    {"Popcuru and Fizzuru",   10e6,  25e6,  10},
    {"Rosey and Teddy",       10e6,  22e6,  10},
    {"La Food Combinasion",   8e6,   18e6,  10},
    {"Spooky and Pumpky",     8e6,   16e6,  10},
    {"Ginger Gerat",          7e6,   15e6,  10},
    {"La Ginger Sekolah",     7e6,   14e6,  10},
    {"Sammyni Fattini",       6e6,   13e6,  10},
    {"Los Spaghettis",        6e6,   12e6,  10},
    {"Ventoliero Pavonero",   5e6,   11e6,  10},
    {"Gold Gold Gold",        5e6,   11e6,  10},
    {"Ketupat Bros",          5e6,   10e6,  10},
    {"Fortunu and Cashuru",   5e6,   10e6,  10},
    {"Los Amigos",            4e6,   9e6,   10},
    {"Los Sekolahs",          4e6,   9e6,   10},
    {"La Casa Boo",           4e6,   8e6,   10},
    {"Fragrama and Chocrama", 4e6,   8e6,   10},
    {"Spaghetti Tualetti",    3e6,   7e6,   10},
    {"Rosetti Tualetti",      3e6,   7e6,   10},
    {"Nacho Spyder",          3e6,   6e6,   10},
    {"Fishino Clownino",      3e6,   6e6,   10},
    {"La Romantic Grande",    3e6,   6e6,   10},
    {"Los Burritos",          2e6,   5e6,   10},
    {"Los Chicleteiras",      2e6,   5e6,   10},
    {"Los Spooky Combinasionas",2e6, 5e6,   10},
    {"Los Jolly Combinasionas", 2e6, 5e6,   10},
    {"Los Combinasionas",     2e6,   5e6,   10},
    -- Secret Low ($300K-$2M)
    {"Agarrini la Palini",    400e3, 500e3, 15},
    {"Chachechi",             380e3, 450e3, 15},
    {"Sammyni Spyderini",     300e3, 380e3, 15},
    {"Los Tralaleritos",      450e3, 600e3, 15},
    {"Bisonte Giuppitere",    280e3, 350e3, 15},
    {"Los Matteos",           280e3, 350e3, 15},
    {"Karkerkar Kurkur",      280e3, 350e3, 15},
    {"Blackhole Goat",        250e3, 350e3, 15},
    {"Giftini Spyderini",     200e3, 400e3, 15},
    {"Graipuss Medussi",      200e3, 400e3, 15},
    {"Los Lucky Blocks",      300e3, 600e3, 15},
    {"Spooky Lucky Block",    300e3, 600e3, 15},
    {"Festive Lucky Block",   300e3, 600e3, 15},
    {"Heart Lucky Block",     300e3, 600e3, 15},
    {"Leprechaun Lucky Block",300e3, 600e3, 15},
    {"Egg Lucky Block",       300e3, 600e3, 15},
    {"Taco Lucky Block",      300e3, 600e3, 15},
    -- Common (70% — most brainrots)
    {"67",                     50e3, 200e3, 70},
    {"Festive 67",             50e3, 200e3, 70},
    {"Los 67",                 50e3, 200e3, 70},
    {"25",                     40e3, 150e3, 70},
    {"Los 25",                 40e3, 150e3, 70},
    {"Antonio",               100e3, 400e3, 70},
    {"Arcadopus",             100e3, 400e3, 70},
    {"Baskito",               100e3, 350e3, 70},
    {"Bunny Bunny Bunny Sahur",80e3, 250e3, 70},
    {"Burrito Bandito",        80e3, 250e3, 70},
    {"Celularcini Viciosini",  80e3, 250e3, 70},
    {"Chicleteira Bicicleteira",70e3,220e3, 70},
    {"Chicleteira Cupideira",  70e3, 220e3, 70},
    {"Chicleteira Noelteira",  70e3, 220e3, 70},
    {"Chicleteirina Bicicleteirina",70e3,200e3,70},
    {"Chimnino",               60e3, 200e3, 70},
    {"Chillin Chili",          60e3, 200e3, 70},
    {"Chipso and Queso",       60e3, 180e3, 70},
    {"Cigno Fulgoro",          60e3, 180e3, 70},
    {"Cloverat Clapat",        60e3, 180e3, 70},
    {"DJ Panda",               60e3, 180e3, 70},
    {"Dug dug dug",            50e3, 170e3, 70},
    {"Easter Easter Easter Sahur",60e3,200e3,70},
    {"Eid Eid Eid Sahur",      60e3, 200e3, 70},
    {"Esok Sekolah",           60e3, 180e3, 70},
    {"Eviledon",               70e3, 200e3, 70},
    {"Gobblino Uniciclino",    60e3, 180e3, 70},
    {"Granny",                100e3, 350e3, 70},
    {"Griffin",               370e6, 430e6,  4}, -- dup handled by weight
    {"Jolly Jolly Sahur",      60e3, 180e3, 70},
    {"Ketupat Kepat",          60e3, 180e3, 70},
    {"La Extinct Grande",      80e3, 250e3, 70},
    {"La Jolly Grande",        80e3, 250e3, 70},
    {"La Spooky Grande",       80e3, 250e3, 70},
    {"La Taco Combinasion",    80e3, 250e3, 70},
    {"Las Sis",                60e3, 180e3, 70},
    {"Lavadorito Spinito",     60e3, 180e3, 70},
    {"Los Bunitos",            60e3, 180e3, 70},
    {"Los Candies",            60e3, 180e3, 70},
    {"Los Cupids",             60e3, 180e3, 70},
    {"Los Hotspotsitos",       60e3, 180e3, 70},
    {"Los Mobilis",            60e3, 180e3, 70},
    {"Los Nooo My Hotspotsitos",60e3,180e3, 70},
    {"Los Planitos",           60e3, 180e3, 70},
    {"Los Primos",             60e3, 180e3, 70},
    {"Los Puggies",            60e3, 180e3, 70},
    {"Los Quesadillas",        60e3, 180e3, 70},
    {"Los Sweethearts",        60e3, 180e3, 70},
    {"Lovin Rose",             60e3, 180e3, 70},
    {"Love Love Bear",        200e6, 250e6,  4}, -- dup handled by weight
    {"Luck Luck Luck Sahur",   60e3, 180e3, 70},
    {"Matteo",                 70e3, 200e3, 70},
    {"Alessio",                70e3, 200e3, 70},
    {"Patteo",                 70e3, 200e3, 70},
    {"Buntteo",                70e3, 200e3, 70},
    {"Frankentteo",            80e3, 220e3, 70},
    {"Extinct Matteo",         80e3, 220e3, 70},
    {"Meowl",                 550e6, 650e6,  1}, -- dup handled by weight
    {"Mi Gatito",              60e3, 180e3, 70},
    {"Money Money Puggy",      80e3, 250e3, 70},
    {"Money Money Reindeer",   80e3, 250e3, 70},
    {"Naughty Naughty",        60e3, 180e3, 70},
    {"Noo my Gold",            60e3, 180e3, 70},
    {"Noo my Heart",           60e3, 180e3, 70},
    {"Noo my Eggs",            60e3, 180e3, 70},
    {"Noo my Present",         60e3, 180e3, 70},
    {"Noo my Candy",           60e3, 180e3, 70},
    {"Nuclearo Dinossauro",   100e3, 350e3, 70},
    {"Orcaledon",             100e3, 350e3, 70},
    {"Pot Hotspot",            60e3, 180e3, 70},
    {"Reinito Sleighito",      70e3, 200e3, 70},
    {"Santa Hotspot",          60e3, 180e3, 70},
    {"Serafinna Medusella",    70e3, 200e3, 70},
    {"Snailo Clovero",         60e3, 180e3, 70},
    {"Spinny Hammy",           60e3, 180e3, 70},
    {"Swaggy Bros",            80e3, 250e3, 70},
    {"Tacorillo Crocodillo",   70e3, 200e3, 70},
    {"Tacorita Bicicleta",     70e3, 200e3, 70},
    {"Tang Tang Keletang",     60e3, 180e3, 70},
    {"Tictac Sahur",           60e3, 180e3, 70},
    {"Tirilikalika Tirilikalako",70e3,200e3, 70},
    {"Tralaledon",             80e3, 250e3, 70},
    {"Tuff Toucan",            80e3, 250e3, 70},
    {"W or L",                 60e3, 180e3, 70},
    -- fun/meme ones
    {"Tralalero Tralala",      50e3, 150e3, 70},
    {"Bombardiro Crocodilo",   50e3, 150e3, 70},
    {"Brr Brr Patapim",        50e3, 150e3, 70},
    {"Tung Tung Tung Sahur",   50e3, 150e3, 70},
    {"Chimpanzini Bananini",   50e3, 150e3, 70},
    {"Ballerina Cappuccina",   50e3, 150e3, 70},
    {"Cappuccino Assassino",   50e3, 150e3, 70},
    {"Sigma Boy",              50e3, 150e3, 70},
    {"Sigma Girl",             50e3, 150e3, 70},
    {"Smurf Cat",              50e3, 150e3, 70},
    {"John Pork",              50e3, 150e3, 70},
    {"Quackula",               50e3, 150e3, 70},
    {"GOAT",                  100e3, 350e3, 70},
    {"1x1x1x1",                50e3, 150e3, 70},
    {"Guest 666",              50e3, 150e3, 70},
    {"Bunnyman",               50e3, 150e3, 70},
    {"Boba Panda",             50e3, 150e3, 70},
    {"Lazy Ducky",             50e3, 150e3, 70},
    {"Puffaball",              50e3, 150e3, 70},
}

-- Build cumulative weight table for O(log n) weighted random
local _totalWeight = 0
local _cumWeights = {}
for i, entry in ipairs(WEIGHTED_BRAINROTS) do
    _totalWeight = _totalWeight + entry[4]
    _cumWeights[i] = _totalWeight
end

local function randomBrainrotWeighted()
    local r = math.random() * _totalWeight
    local lo, hi = 1, #_cumWeights
    while lo < hi do
        local mid = math.floor((lo + hi) / 2)
        if _cumWeights[mid] < r then lo = mid + 1 else hi = mid end
    end
    return WEIGHTED_BRAINROTS[lo]
end

local function formatMoney(v)
    if v >= 1e9 then return string.format("$%.2fB/s", v/1e9)
    elseif v >= 1e6 then return string.format("$%.1fM/s", v/1e6)
    elseif v >= 1e3 then return string.format("$%.0fK/s", v/1e3)
    else return string.format("$%.0f/s", v) end
end

local function randomMoneyVal()
    -- not used directly anymore — kept for compatibility
    return "$1M/s", 1e6
end

local function randomPlayers()
    -- 1 in 4 chance of being full (8/8)
    if math.random(1,4) == 1 then return "8", true end
    return tostring(math.random(1,7)), false
end

local function randomBrainrot()
    return BRAINROTS[math.random(1, #BRAINROTS)]
end

-- ══════════════════════════════════════════
--  TELEPORT (joins a real random server)
-- ══════════════════════════════════════════
local function getServers(fullOnly)
    local servers = {}
    pcall(function()
        local url = "https://games.roblox.com/v1/games/"..PLACE_ID.."/servers/Public?sortOrder=Asc&limit=100"
        local data = HttpService:JSONDecode(game:HttpGet(url))
        if data and data.data then
            for _, s in ipairs(data.data) do
                if s.id then
                    if fullOnly then
                        if s.playing and s.maxPlayers and s.playing >= s.maxPlayers - 1 then
                            table.insert(servers, s.id)
                        end
                    else
                        table.insert(servers, s.id)
                    end
                end
            end
        end
    end)
    return servers
end

local function joinRandom()
    local servers = getServers(false)
    if #servers > 0 then
        pcall(function() TeleportService:TeleportToPlaceInstance(PLACE_ID, servers[math.random(1,#servers)], Player) end)
    else
        pcall(function() TeleportService:Teleport(PLACE_ID, Player) end)
    end
end

local function joinFull()
    local servers = getServers(true)
    if #servers > 0 then
        pcall(function() TeleportService:TeleportToPlaceInstance(PLACE_ID, servers[math.random(1,#servers)], Player) end)
    else
        joinRandom()
    end
end

-- ══════════════════════════════════════════
--  PILL
-- ══════════════════════════════════════════
local Pill = Instance.new("TextButton", ScreenGui)
Pill.BackgroundColor3 = Color3.fromRGB(5,5,13)
Pill.Position = UDim2.new(0.5,-55,0,14); Pill.Size = UDim2.new(0,110,0,28)
Pill.Font = Enum.Font.GothamBlack; Pill.Text = "◈  SYN7"
Pill.TextColor3 = Color3.fromRGB(0,180,255); Pill.TextSize = 13
Pill.AutoButtonColor = false; Pill.ZIndex = 20; Pill.Visible = false
Instance.new("UICorner", Pill).CornerRadius = UDim.new(1,0)
local PillS = Instance.new("UIStroke", Pill)
PillS.Color = Color3.fromRGB(0,140,255); PillS.Thickness = 1.5
task.spawn(function()
    while Pill and Pill.Parent do
        TweenService:Create(PillS,TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Transparency=0}):Play(); task.wait(1.2)
        TweenService:Create(PillS,TweenInfo.new(1.2,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Transparency=0.6}):Play(); task.wait(1.2)
    end
end)

-- ══════════════════════════════════════════
--  MAIN FRAME
-- ══════════════════════════════════════════
local Frame = Instance.new("CanvasGroup", ScreenGui)
Frame.BackgroundColor3 = Color3.fromRGB(7,7,16); Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.5,-340,0.5,-200); Frame.Size = UDim2.new(0,680,0,400)
Frame.Active = true; Frame.GroupTransparency = 1; Frame.ZIndex = 5
Instance.new("UICorner", Frame).CornerRadius = UDim.new(0,18)
local UIScale = Instance.new("UIScale", Frame); UIScale.Scale = 0.0
local FrameGlow = Instance.new("UIStroke", Frame)
FrameGlow.Color = Color3.fromRGB(0,110,255); FrameGlow.Thickness = 1.5; FrameGlow.Transparency = 0.5

-- intro burst
local BL = Instance.new("Frame", ScreenGui); BL.BackgroundTransparency=1; BL.Size=UDim2.new(1,0,1,0); BL.ZIndex=30
local bCols={Color3.fromRGB(0,140,255),Color3.fromRGB(80,200,255),Color3.fromRGB(0,80,220),Color3.fromRGB(160,220,255),Color3.fromRGB(255,255,255)}
local function spawnBP(cx,cy,d)
    task.delay(d,function()
        if not BL or not BL.Parent then return end
        local sz=math.random(6,20); local a=math.rad(math.random(0,360)); local dist=math.random(80,340)
        local p=Instance.new("Frame",BL); p.BackgroundColor3=bCols[math.random(1,#bCols)]
        p.BackgroundTransparency=0.1; p.BorderSizePixel=0; p.AnchorPoint=Vector2.new(0.5,0.5)
        p.Position=UDim2.new(0,cx,0,cy); p.Size=UDim2.new(0,sz,0,sz); p.ZIndex=31
        Instance.new("UICorner",p).CornerRadius=UDim.new(1,0)
        TweenService:Create(p,TweenInfo.new(0.55,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Position=UDim2.new(0,cx+math.cos(a)*dist,0,cy+math.sin(a)*dist),Size=UDim2.new(0,sz*1.6,0,sz*1.6)}):Play()
        task.delay(0.45,function() if not p or not p.Parent then return end
            TweenService:Create(p,TweenInfo.new(0.35,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{BackgroundTransparency=1,Size=UDim2.new(0,2,0,2)}):Play()
            task.delay(0.36,function() if p and p.Parent then p:Destroy() end end)
        end)
    end)
end
task.spawn(function()
    local cam=workspace.CurrentCamera; if not cam then workspace:GetPropertyChangedSignal("CurrentCamera"):Wait(); cam=workspace.CurrentCamera end
    local vp=cam.ViewportSize; local cx,cy=vp.X/2,vp.Y/2
    -- reduced to 20 particles to avoid lag spike
    for i=1,20 do spawnBP(cx,cy,i*0.02) end
    task.wait(0.28); Frame.GroupTransparency=1; Frame.Visible=true; UIScale.Scale=1.2*TARGET_SCALE
    TweenService:Create(Frame,TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{GroupTransparency=0}):Play()
    TweenService:Create(UIScale,TweenInfo.new(0.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Scale=TARGET_SCALE}):Play()
    task.wait(1.0); if BL and BL.Parent then BL:Destroy() end
end)
task.spawn(function()
    task.wait(1.0)
    while Frame and Frame.Parent do
        pcall(function()
            TweenService:Create(FrameGlow,TweenInfo.new(2.4,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Transparency=0.08}):Play()
        end); task.wait(2.4)
        pcall(function()
            TweenService:Create(FrameGlow,TweenInfo.new(2.4,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Transparency=0.72}):Play()
        end); task.wait(2.4)
    end
end)

-- orbs (throttled: max 3 alive, slow spawn rate)
local PL=Instance.new("Frame",Frame); PL.BackgroundTransparency=1; PL.Size=UDim2.new(1,0,1,0); PL.ZIndex=1
Instance.new("UICorner",PL).CornerRadius=UDim.new(0,18)
local oC={{Color3.fromRGB(0,120,255),Color3.fromRGB(100,200,255)},{Color3.fromRGB(0,80,220),Color3.fromRGB(80,170,255)}}
local orbCount = 0
task.spawn(function()
    while Frame and Frame.Parent do
        if orbCount < 3 then
            orbCount += 1
            local col=oC[math.random(1,#oC)]; local sz=math.random(10,24); local sx=math.random(3,97)/100
            local orb=Instance.new("Frame",PL); orb.BackgroundColor3=col[1]; orb.BackgroundTransparency=math.random(25,50)/100
            orb.BorderSizePixel=0; orb.Size=UDim2.new(0,sz,0,sz); orb.Position=UDim2.new(sx,0,1.04,0); orb.ZIndex=2
            Instance.new("UICorner",orb).CornerRadius=UDim.new(1,0)
            local dur=math.random(60,100)/10; local drift=math.random(-40,40)/1000
            TweenService:Create(orb,TweenInfo.new(dur,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{Position=UDim2.new(sx+drift,0,-0.06,0),BackgroundTransparency=1,Size=UDim2.new(0,sz*0.3,0,sz*0.3)}):Play()
            task.delay(dur,function() orbCount=math.max(0,orbCount-1); if orb and orb.Parent then orb:Destroy() end end)
        end
        task.wait(2) -- spawn max 1 orb every 2 seconds
    end
end)

-- ══════════════════════════════════════════
--  HEADER
-- ══════════════════════════════════════════
local Header=Instance.new("Frame",Frame); Header.BackgroundColor3=Color3.fromRGB(4,4,11)
Header.BorderSizePixel=0; Header.Size=UDim2.new(1,0,0,46); Header.ZIndex=6
Instance.new("UICorner",Header).CornerRadius=UDim.new(0,18)
local HFix=Instance.new("Frame",Header); HFix.BackgroundColor3=Color3.fromRGB(4,4,11)
HFix.BorderSizePixel=0; HFix.Position=UDim2.new(0,0,0.5,0); HFix.Size=UDim2.new(1,0,0.5,0); HFix.ZIndex=6
local HLine=Instance.new("Frame",Frame); HLine.BackgroundColor3=Color3.fromRGB(0,100,255)
HLine.BackgroundTransparency=0.6; HLine.BorderSizePixel=0; HLine.Position=UDim2.new(0,0,0,46); HLine.Size=UDim2.new(1,0,0,1); HLine.ZIndex=6

local LogoTxt=Instance.new("TextLabel",Header); LogoTxt.BackgroundTransparency=1
LogoTxt.Position=UDim2.new(0,16,0,0); LogoTxt.Size=UDim2.new(0,50,1,0)
LogoTxt.Font=Enum.Font.GothamBlack; LogoTxt.Text="SYN7"; LogoTxt.TextColor3=Color3.fromRGB(255,255,255)
LogoTxt.TextSize=18; LogoTxt.TextXAlignment=Enum.TextXAlignment.Left; LogoTxt.ZIndex=8

local LogoAccent=Instance.new("TextLabel",Header); LogoAccent.BackgroundTransparency=1
LogoAccent.Position=UDim2.new(0,62,0,0); LogoAccent.Size=UDim2.new(0,90,1,0)
LogoAccent.Font=Enum.Font.GothamMedium; LogoAccent.Text="NOTIFIER"
LogoAccent.TextColor3=Color3.fromRGB(0,160,255); LogoAccent.TextSize=11
LogoAccent.TextXAlignment=Enum.TextXAlignment.Left; LogoAccent.ZIndex=8

-- live badge (always green — it's fake but looks real)
local LiveBadge=Instance.new("Frame",Header); LiveBadge.BackgroundColor3=Color3.fromRGB(0,30,10)
LiveBadge.Position=UDim2.new(0,160,0.5,-10); LiveBadge.Size=UDim2.new(0,68,0,20); LiveBadge.ZIndex=8
Instance.new("UICorner",LiveBadge).CornerRadius=UDim.new(0,5)
local LBS=Instance.new("UIStroke",LiveBadge); LBS.Color=Color3.fromRGB(40,200,80); LBS.Thickness=1; LBS.Transparency=0.3
local LiveTxt=Instance.new("TextLabel",LiveBadge); LiveTxt.BackgroundTransparency=1
LiveTxt.Size=UDim2.new(1,0,1,0); LiveTxt.Font=Enum.Font.GothamBold; LiveTxt.Text="● WS LIVE"
LiveTxt.TextColor3=Color3.fromRGB(50,220,90); LiveTxt.TextSize=9; LiveTxt.ZIndex=9
task.spawn(function()
    while LiveTxt and LiveTxt.Parent do
        TweenService:Create(LiveTxt,TweenInfo.new(0.7,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{TextTransparency=0.5}):Play(); task.wait(0.7)
        TweenService:Create(LiveTxt,TweenInfo.new(0.7,Enum.EasingStyle.Sine,Enum.EasingDirection.InOut),{TextTransparency=0}):Play(); task.wait(0.7)
    end
end)

-- bot badge removed

-- header buttons
local HBRow=Instance.new("Frame",Header); HBRow.BackgroundTransparency=1; HBRow.AnchorPoint=Vector2.new(1,0.5)
HBRow.Position=UDim2.new(1,-10,0.5,0); HBRow.Size=UDim2.new(0,95,0,28); HBRow.ZIndex=8
local HBRL=Instance.new("UIListLayout",HBRow); HBRL.FillDirection=Enum.FillDirection.Horizontal
HBRL.HorizontalAlignment=Enum.HorizontalAlignment.Right; HBRL.VerticalAlignment=Enum.VerticalAlignment.Center
HBRL.Padding=UDim.new(0,5); HBRL.SortOrder=Enum.SortOrder.LayoutOrder
local function hBtn(lbl,order,danger)
    local b=Instance.new("TextButton",HBRow)
    b.BackgroundColor3=danger and Color3.fromRGB(20,6,6) or Color3.fromRGB(12,12,24)
    b.Size=UDim2.new(0,28,0,26); b.Font=Enum.Font.GothamBold; b.Text=lbl
    b.TextColor3=danger and Color3.fromRGB(200,80,80) or Color3.fromRGB(160,170,210)
    b.TextSize=13; b.ZIndex=9; b.LayoutOrder=order; b.AutoButtonColor=false
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
    Instance.new("UIStroke",b).Color=danger and Color3.fromRGB(60,15,15) or Color3.fromRGB(25,27,50)
    b.MouseEnter:Connect(function() TweenService:Create(b,tw,{BackgroundColor3=danger and Color3.fromRGB(180,20,20) or Color3.fromRGB(0,90,210),TextColor3=Color3.fromRGB(255,255,255)}):Play() end)
    b.MouseLeave:Connect(function() TweenService:Create(b,tw,{BackgroundColor3=danger and Color3.fromRGB(20,6,6) or Color3.fromRGB(12,12,24),TextColor3=danger and Color3.fromRGB(200,80,80) or Color3.fromRGB(160,170,210)}):Play() end)
    return b
end
local MinBtn   = hBtn("–", 1, false)
local CloseBtn = hBtn("✕", 2, true)

-- ══════════════════════════════════════════
--  BODY
-- ══════════════════════════════════════════
local Body=Instance.new("Frame",Frame); Body.BackgroundTransparency=1
Body.Position=UDim2.new(0,0,0,48); Body.Size=UDim2.new(1,0,1,-48); Body.ZIndex=6

-- LEFT COL
local LeftCol=Instance.new("Frame",Body); LeftCol.BackgroundColor3=Color3.fromRGB(4,4,11)
LeftCol.BorderSizePixel=0; LeftCol.Position=UDim2.new(0,8,0,8); LeftCol.Size=UDim2.new(0,136,1,-16); LeftCol.ZIndex=7
Instance.new("UICorner",LeftCol).CornerRadius=UDim.new(0,12); Instance.new("UIStroke",LeftCol).Color=Color3.fromRGB(16,18,38)

local LColTitle=Instance.new("TextLabel",LeftCol); LColTitle.BackgroundTransparency=1
LColTitle.Position=UDim2.new(0,10,0,8); LColTitle.Size=UDim2.new(1,-10,0,14)
LColTitle.Font=Enum.Font.GothamBold; LColTitle.Text="FILTERS"; LColTitle.TextColor3=Color3.fromRGB(40,55,110)
LColTitle.TextSize=9; LColTitle.TextXAlignment=Enum.TextXAlignment.Left; LColTitle.ZIndex=8

local FHolder=Instance.new("Frame",LeftCol); FHolder.BackgroundTransparency=1
FHolder.Position=UDim2.new(0,6,0,26); FHolder.Size=UDim2.new(1,-12,0,158); FHolder.ZIndex=8
local FList=Instance.new("UIListLayout",FHolder); FList.SortOrder=Enum.SortOrder.LayoutOrder; FList.Padding=UDim.new(0,5)
local sideFilters={}
local fDefs={
    {t="ALL",  sub="everything",f="ALL",  c=Color3.fromRGB(0,140,255), lo=1,def=true},
    {t="100M+",sub="legendary", f="100m+",c=Color3.fromRGB(0,230,255), lo=2,def=false},
    {t="50M+", sub="rare",      f="50m+", c=Color3.fromRGB(255,165,0), lo=3,def=false},
    {t="10M+", sub="uncommon",  f="10m+", c=Color3.fromRGB(130,255,90),lo=4,def=false},
}
local function applyFilter()
    for _,e in ipairs(LogEntries) do
        if e.Dead then e.UI.Visible=false; continue end
        local v=e.NumericValue
        if CurrentFilter=="ALL" then e.UI.Visible=true
        elseif CurrentFilter=="100m+" then e.UI.Visible=(v>=100000000)
        elseif CurrentFilter=="50m+"  then e.UI.Visible=(v>=50000000 and v<100000000)
        elseif CurrentFilter=="10m+"  then e.UI.Visible=(v>=10000000 and v<50000000)
        else e.UI.Visible=false end
    end
end
local function setFilter(f)
    CurrentFilter=f
    for _,d in ipairs(sideFilters) do
        local a=d.f==f
        TweenService:Create(d.btn,tw,{BackgroundColor3=a and d.c or Color3.fromRGB(10,10,22)}):Play()
        TweenService:Create(d.ml, tw,{TextColor3=a and Color3.fromRGB(255,255,255) or Color3.fromRGB(90,100,145)}):Play()
        TweenService:Create(d.sl, tw,{TextColor3=a and Color3.fromRGB(210,230,255) or Color3.fromRGB(38,42,72)}):Play()
        TweenService:Create(d.st, tw,{Color=a and d.c or Color3.fromRGB(18,20,42),Transparency=a and 0.2 or 0.7}):Play()
    end
    applyFilter()
end
for _,fd in ipairs(fDefs) do
    local btn=Instance.new("TextButton",FHolder)
    btn.BackgroundColor3=fd.def and fd.c or Color3.fromRGB(10,10,22)
    btn.Size=UDim2.new(1,0,0,32); btn.Text=""; btn.AutoButtonColor=false; btn.ZIndex=9; btn.LayoutOrder=fd.lo
    Instance.new("UICorner",btn).CornerRadius=UDim.new(0,7)
    local st=Instance.new("UIStroke",btn); st.Color=fd.def and fd.c or Color3.fromRGB(18,20,42); st.Thickness=1; st.Transparency=fd.def and 0.2 or 0.7
    local ml=Instance.new("TextLabel",btn); ml.BackgroundTransparency=1
    ml.Position=UDim2.new(0,9,0,3); ml.Size=UDim2.new(1,-11,0,14); ml.Font=Enum.Font.GothamBold; ml.Text=fd.t
    ml.TextColor3=fd.def and Color3.fromRGB(255,255,255) or Color3.fromRGB(90,100,145); ml.TextSize=12; ml.TextXAlignment=Enum.TextXAlignment.Left; ml.ZIndex=10
    local sl=Instance.new("TextLabel",btn); sl.BackgroundTransparency=1
    sl.Position=UDim2.new(0,9,0,17); sl.Size=UDim2.new(1,-11,0,11); sl.Font=Enum.Font.GothamMedium; sl.Text=fd.sub
    sl.TextColor3=fd.def and Color3.fromRGB(210,230,255) or Color3.fromRGB(38,42,72); sl.TextSize=8; sl.TextXAlignment=Enum.TextXAlignment.Left; sl.ZIndex=10
    table.insert(sideFilters,{btn=btn,ml=ml,sl=sl,st=st,f=fd.f,c=fd.c})
    btn.MouseButton1Click:Connect(function() playClick(); setFilter(fd.f) end)
end

-- Speed is now driven by bot count (no manual control)

-- AUTO JOIN button removed

-- RIGHT PANEL
local RightPanel=Instance.new("Frame",Body); RightPanel.BackgroundColor3=Color3.fromRGB(4,4,11)
RightPanel.BorderSizePixel=0; RightPanel.Position=UDim2.new(0,152,0,8); RightPanel.Size=UDim2.new(1,-160,1,-16); RightPanel.ZIndex=7
Instance.new("UICorner",RightPanel).CornerRadius=UDim.new(0,12); Instance.new("UIStroke",RightPanel).Color=Color3.fromRGB(16,18,38)

local LogScroll=Instance.new("ScrollingFrame",RightPanel); LogScroll.Active=true; LogScroll.BackgroundTransparency=1; LogScroll.BorderSizePixel=0
LogScroll.Position=UDim2.new(0,7,0,7); LogScroll.Size=UDim2.new(1,-12,1,-12)
LogScroll.ScrollBarThickness=2; LogScroll.ScrollBarImageColor3=Color3.fromRGB(0,120,255)
LogScroll.AutomaticCanvasSize=Enum.AutomaticSize.Y; LogScroll.ZIndex=9
local LogList=Instance.new("UIListLayout",LogScroll); LogList.SortOrder=Enum.SortOrder.LayoutOrder; LogList.Padding=UDim.new(0,5)
local EmptyLbl=Instance.new("TextLabel",RightPanel); EmptyLbl.BackgroundTransparency=1; EmptyLbl.AnchorPoint=Vector2.new(0.5,0.5)
EmptyLbl.Position=UDim2.new(0.5,0,0.5,0); EmptyLbl.Size=UDim2.new(0.85,0,0,44)
EmptyLbl.Font=Enum.Font.GothamMedium; EmptyLbl.Text="✦  Scanning for brainrots..."
EmptyLbl.TextColor3=Color3.fromRGB(30,35,72); EmptyLbl.TextSize=13; EmptyLbl.ZIndex=9; EmptyLbl.Visible=true

-- ══════════════════════════════════════════
--  HELPERS
-- ══════════════════════════════════════════
local function getTier(v)
    if v>=100000000 then return "💎 100M+",Color3.fromRGB(0,230,255)
    elseif v>=50000000 then return "🔥 50M+",Color3.fromRGB(255,165,0)
    elseif v>=10000000 then return "⚡ 10M+",Color3.fromRGB(130,255,90)
    else return nil,nil end
end

local logOrder=0

-- ══════════════════════════════════════════
--  CREATE FAKE LOG
-- ══════════════════════════════════════════
local function CreateFakeLog()
    local entry = randomBrainrotWeighted()
    local name = entry[1]
    local minM, maxM = entry[2], entry[3]
    local rawVal = minM + math.random() * (maxM - minM)
    local moneyStr = formatMoney(rawVal)
    local numVal = rawVal
    local players, isFull = randomPlayers()
    local display = players.."/8"..(isFull and "  🔴 FULL" or "")
    local secondsLeft = math.random(20,30)
    local tierTxt, tierCol = getTier(numVal)
    local entryCol = tierCol or Color3.fromRGB(0,200,80)

    logOrder += 1
    EmptyLbl.Visible = false

    local Item=Instance.new("Frame",LogScroll); Item.BackgroundColor3=Color3.fromRGB(8,8,18)
    Item.Size=UDim2.new(1,-4,0,52); Item.BorderSizePixel=0; Item.ZIndex=10; Item.LayoutOrder=logOrder
    Instance.new("UICorner",Item).CornerRadius=UDim.new(0,9)
    local IStr=Instance.new("UIStroke",Item); IStr.Color=entryCol; IStr.Thickness=1; IStr.Transparency=0.5
    local Bar=Instance.new("Frame",Item); Bar.BackgroundColor3=entryCol
    Bar.BorderSizePixel=0; Bar.Position=UDim2.new(0,0,0.12,0); Bar.Size=UDim2.new(0,3,0.76,0); Bar.ZIndex=11
    Instance.new("UICorner",Bar).CornerRadius=UDim.new(1,0)

    local NLbl=Instance.new("TextLabel",Item); NLbl.BackgroundTransparency=1; NLbl.Position=UDim2.new(0,11,0,6)
    NLbl.Size=UDim2.new(0.55,0,0,17); NLbl.Font=Enum.Font.GothamBold; NLbl.Text=name
    NLbl.TextColor3=Color3.fromRGB(215,222,255); NLbl.TextSize=12; NLbl.TextXAlignment=Enum.TextXAlignment.Left
    NLbl.TextTruncate=Enum.TextTruncate.AtEnd; NLbl.ZIndex=11

    local MLbl=Instance.new("TextLabel",Item); MLbl.BackgroundTransparency=1; MLbl.Position=UDim2.new(0,11,0,26)
    MLbl.Size=UDim2.new(0.5,0,0,14); MLbl.Font=Enum.Font.GothamMedium; MLbl.Text=display
    MLbl.TextColor3=Color3.fromRGB(80,200,120); MLbl.TextSize=10; MLbl.TextXAlignment=Enum.TextXAlignment.Left; MLbl.ZIndex=11

    if tierTxt then
        local TBadge=Instance.new("TextLabel",Item); TBadge.BackgroundColor3=Color3.fromRGB(5,5,15)
        TBadge.Position=UDim2.new(0.58,0,0,6); TBadge.Size=UDim2.new(0,60,0,15); TBadge.Font=Enum.Font.GothamBold
        TBadge.Text=tierTxt; TBadge.TextColor3=tierCol; TBadge.TextSize=9; TBadge.ZIndex=11
        Instance.new("UICorner",TBadge).CornerRadius=UDim.new(0,4)
        Instance.new("UIStroke",TBadge).Color=tierCol
    end

    local CDown=Instance.new("TextLabel",Item); CDown.BackgroundTransparency=1
    CDown.Position=UDim2.new(0.58,0,0,26); CDown.Size=UDim2.new(0,55,0,14)
    CDown.Font=Enum.Font.GothamMedium; CDown.Text="⏱ "..secondsLeft.."s"
    CDown.TextColor3=Color3.fromRGB(50,58,105); CDown.TextSize=9; CDown.ZIndex=11

    local BRow=Instance.new("Frame",Item); BRow.BackgroundTransparency=1; BRow.AnchorPoint=Vector2.new(1,0.5)
    BRow.Position=UDim2.new(1,-6,0.5,0); BRow.Size=UDim2.new(0,112,0,24); BRow.ZIndex=11
    local BRL=Instance.new("UIListLayout",BRow); BRL.FillDirection=Enum.FillDirection.Horizontal
    BRL.HorizontalAlignment=Enum.HorizontalAlignment.Right; BRL.VerticalAlignment=Enum.VerticalAlignment.Center; BRL.Padding=UDim.new(0,5)
    local function mkB(lbl,w)
        local b=Instance.new("TextButton",BRow); b.BackgroundColor3=Color3.fromRGB(0,85,210)
        b.Size=UDim2.new(0,w,0,22); b.Font=Enum.Font.GothamBold; b.Text=lbl; b.TextColor3=Color3.fromRGB(255,255,255)
        b.TextSize=10; b.ZIndex=12; b.AutoButtonColor=false
        Instance.new("UICorner",b).CornerRadius=UDim.new(0,5)
        b.MouseEnter:Connect(function() TweenService:Create(b,tw,{BackgroundColor3=Color3.fromRGB(0,130,255)}):Play() end)
        b.MouseLeave:Connect(function() TweenService:Create(b,tw,{BackgroundColor3=Color3.fromRGB(0,85,210)}):Play() end)
        return b
    end
    local jBtn=mkB("JOIN",46); local fBtn=mkB("FORCE",54)
    -- JOIN: first few clicks show "Server Full" toast, then actually teleport
    local joinAttempts = 0
    local minAttempts = math.random(3, 7) -- how many times they need to click before getting in

    jBtn.MouseButton1Click:Connect(function()
        playClick()
        joinAttempts += 1
        if joinAttempts < minAttempts then
            -- show fake "server full" toast notification
            local toast = Instance.new("Frame", ScreenGui)
            toast.BackgroundColor3 = Color3.fromRGB(20, 8, 8)
            toast.AnchorPoint = Vector2.new(0.5, 1)
            toast.Position = UDim2.new(0.5, 0, 1, -20)
            toast.Size = UDim2.new(0, 320, 0, 48)
            toast.ZIndex = 50; toast.BackgroundTransparency = 1
            Instance.new("UICorner", toast).CornerRadius = UDim.new(0, 10)
            local ts2 = Instance.new("UIStroke", toast); ts2.Color = Color3.fromRGB(200, 40, 40); ts2.Thickness = 1.5
            local toastIcon = Instance.new("TextLabel", toast); toastIcon.BackgroundTransparency = 1
            toastIcon.Position = UDim2.new(0, 12, 0, 0); toastIcon.Size = UDim2.new(0, 32, 1, 0)
            toastIcon.Font = Enum.Font.GothamBold; toastIcon.Text = "🔴"; toastIcon.TextSize = 18; toastIcon.ZIndex = 51
            local toastMsg = Instance.new("TextLabel", toast); toastMsg.BackgroundTransparency = 1
            toastMsg.Position = UDim2.new(0, 44, 0, 0); toastMsg.Size = UDim2.new(1, -54, 0.55, 0)
            toastMsg.Font = Enum.Font.GothamBold; toastMsg.Text = "Server Full!"
            toastMsg.TextColor3 = Color3.fromRGB(255, 80, 80); toastMsg.TextSize = 13
            toastMsg.TextXAlignment = Enum.TextXAlignment.Left; toastMsg.ZIndex = 51
            local toastSub = Instance.new("TextLabel", toast); toastSub.BackgroundTransparency = 1
            toastSub.Position = UDim2.new(0, 44, 0.5, 0); toastSub.Size = UDim2.new(1, -54, 0.5, 0)
            toastSub.Font = Enum.Font.GothamMedium
            local remaining = minAttempts - joinAttempts
            toastSub.Text = "Retrying... ("..remaining.." attempt"..(remaining==1 and "" or "s").." left)"
            toastSub.TextColor3 = Color3.fromRGB(160, 80, 80); toastSub.TextSize = 10
            toastSub.TextXAlignment = Enum.TextXAlignment.Left; toastSub.ZIndex = 51
            -- slide in
            TweenService:Create(toast, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency=0, Position=UDim2.new(0.5,0,1,-20)}):Play()
            task.delay(0.1, function()
                TweenService:Create(toast, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency=0}):Play()
            end)
            -- flash the join button red briefly
            TweenService:Create(jBtn, tw, {BackgroundColor3=Color3.fromRGB(160,20,20)}):Play()
            task.delay(0.4, function()
                TweenService:Create(jBtn, tw, {BackgroundColor3=Color3.fromRGB(0,85,210)}):Play()
            end)
            -- slide out after 2s
            task.delay(2, function()
                if toast and toast.Parent then
                    TweenService:Create(toast, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {BackgroundTransparency=1, Position=UDim2.new(0.5,0,1,60)}):Play()
                    task.delay(0.35, function() if toast and toast.Parent then toast:Destroy() end end)
                end
            end)
        else
            -- enough attempts — actually let them in
            local successToast = Instance.new("Frame", ScreenGui)
            successToast.BackgroundColor3 = Color3.fromRGB(5, 22, 10)
            successToast.AnchorPoint = Vector2.new(0.5, 1)
            successToast.Position = UDim2.new(0.5, 0, 1, 60)
            successToast.Size = UDim2.new(0, 320, 0, 48)
            successToast.ZIndex = 50; successToast.BackgroundTransparency = 1
            Instance.new("UICorner", successToast).CornerRadius = UDim.new(0, 10)
            local ss = Instance.new("UIStroke", successToast); ss.Color = Color3.fromRGB(40, 200, 80); ss.Thickness = 1.5
            local sIcon = Instance.new("TextLabel", successToast); sIcon.BackgroundTransparency = 1
            sIcon.Position = UDim2.new(0, 12, 0, 0); sIcon.Size = UDim2.new(0, 32, 1, 0)
            sIcon.Font = Enum.Font.GothamBold; sIcon.Text = "✅"; sIcon.TextSize = 18; sIcon.ZIndex = 51
            local sMsg = Instance.new("TextLabel", successToast); sMsg.BackgroundTransparency = 1
            sMsg.Position = UDim2.new(0, 44, 0, 0); sMsg.Size = UDim2.new(1, -54, 0.55, 0)
            sMsg.Font = Enum.Font.GothamBold; sMsg.Text = "Slot found! Joining..."
            sMsg.TextColor3 = Color3.fromRGB(80, 255, 120); sMsg.TextSize = 13
            sMsg.TextXAlignment = Enum.TextXAlignment.Left; sMsg.ZIndex = 51
            local sSub = Instance.new("TextLabel", successToast); sSub.BackgroundTransparency = 1
            sSub.Position = UDim2.new(0, 44, 0.5, 0); sSub.Size = UDim2.new(1, -54, 0.5, 0)
            sSub.Font = Enum.Font.GothamMedium; sSub.Text = "Teleporting now..."
            sSub.TextColor3 = Color3.fromRGB(40, 160, 80); sSub.TextSize = 10
            sSub.TextXAlignment = Enum.TextXAlignment.Left; sSub.ZIndex = 51
            TweenService:Create(successToast, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Position=UDim2.new(0.5,0,1,-20)}):Play()
            task.delay(0.1, function()
                TweenService:Create(successToast, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {BackgroundTransparency=0}):Play()
            end)
            task.delay(1.2, function()
                joinRandom()
                if successToast and successToast.Parent then
                    TweenService:Create(successToast, TweenInfo.new(0.3, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {BackgroundTransparency=1, Position=UDim2.new(0.5,0,1,60)}):Play()
                    task.delay(0.35, function() if successToast and successToast.Parent then successToast:Destroy() end end)
                end
            end)
        end
    end)
    fBtn.MouseButton1Click:Connect(function() playClick(); joinFull() end)

    local entryData={NumericValue=numVal, UI=Item, Dead=false}
    table.insert(LogEntries, entryData)
    -- cap at 30 entries max to prevent memory buildup
    if #LogEntries > 30 then
        local oldest = table.remove(LogEntries, 1)
        if oldest and oldest.UI and oldest.UI.Parent then oldest.UI:Destroy() end
    end
    applyFilter()

    task.spawn(function()
        for t=secondsLeft-1,0,-1 do
            task.wait(1); if not Item.Parent then return end
            CDown.Text="⏱ "..t.."s"
            if t<=5 then TweenService:Create(CDown,tw,{TextColor3=Color3.fromRGB(210,55,55)}):Play()
            elseif t<=10 then TweenService:Create(CDown,tw,{TextColor3=Color3.fromRGB(220,145,0)}):Play() end
        end
        task.wait(0.3); if not Item.Parent then return end
        entryData.Dead=true
        for _,obj in ipairs({Item,NLbl,MLbl,Bar,CDown}) do
            TweenService:Create(obj,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{[obj:IsA("TextLabel") and "TextTransparency" or "BackgroundTransparency"]=1}):Play()
        end
        TweenService:Create(IStr,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{Transparency=1}):Play()
        task.wait(0.55); Item:Destroy()
        for i=#LogEntries,1,-1 do if LogEntries[i]==entryData then table.remove(LogEntries,i); break end end
        if #LogEntries==0 then EmptyLbl.Visible=true end
    end)

    LogScroll.CanvasPosition = Vector2.new(0, math.huge)
end

-- ══════════════════════════════════════════
--  WINDOW CONTROLS
-- ══════════════════════════════════════════
local function closeGui()
    TweenService:Create(UIScale,TweenInfo.new(0.22,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{Scale=TARGET_SCALE-0.1}):Play()
    TweenService:Create(Frame,TweenInfo.new(0.22,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{GroupTransparency=1}):Play()
    task.wait(0.25); Frame.Visible=false; Pill.Visible=true
end
local function openGui()
    Frame.Visible=true; Pill.Visible=false
    TweenService:Create(Frame,TweenInfo.new(0.35,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{GroupTransparency=0}):Play()
    TweenService:Create(UIScale,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Scale=TARGET_SCALE}):Play()
end
MinBtn.MouseButton1Click:Connect(function() playClick(); closeGui() end)
Pill.MouseButton1Click:Connect(function() playClick(); openGui() end)
CloseBtn.MouseButton1Click:Connect(function()
    playClick()
    TweenService:Create(UIScale,TweenInfo.new(0.22,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{Scale=TARGET_SCALE-0.1}):Play()
    TweenService:Create(Frame,TweenInfo.new(0.22,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{GroupTransparency=1}):Play()
    task.wait(0.25); ScreenGui:Destroy()
end)

-- Drag
local dragging,dragStart,startPos,dragInput=false,nil,nil,nil
Header.InputBegan:Connect(function(inp)
    if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
        dragging=true; dragStart=inp.Position; startPos=Frame.Position
        TweenService:Create(UIScale,TweenInfo.new(0.1,Enum.EasingStyle.Quint),{Scale=TARGET_SCALE*0.988}):Play()
        inp.Changed:Connect(function()
            if inp.UserInputState==Enum.UserInputState.End then
                dragging=false; TweenService:Create(UIScale,TweenInfo.new(0.16,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Scale=TARGET_SCALE}):Play()
            end
        end)
    end
end)
Header.InputChanged:Connect(function(inp)
    if inp.UserInputType==Enum.UserInputType.MouseMovement or inp.UserInputType==Enum.UserInputType.Touch then dragInput=inp end
end)
UserInputService.InputChanged:Connect(function(inp)
    if dragging and inp==dragInput and dragStart and startPos then
        local d=inp.Position-dragStart
        TweenService:Create(Frame,dragTI,{Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+d.X,startPos.Y.Scale,startPos.Y.Offset+d.Y)}):Play()
    end
end)
UserInputService.InputEnded:Connect(function(inp)
    if inp.UserInputType==Enum.UserInputType.MouseButton1 or inp.UserInputType==Enum.UserInputType.Touch then
        dragging=false; TweenService:Create(UIScale,TweenInfo.new(0.16,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Scale=TARGET_SCALE}):Play()
    end
end)

-- ══════════════════════════════════════════
--  FAKE LOG LOOP
-- ══════════════════════════════════════════
task.spawn(function()
    task.wait(3)
    while ScreenGui and ScreenGui.Parent do
        CreateFakeLog()
        -- fixed medium speed with slight jitter
        local jitter = math.random(-8, 8) / 10
        task.wait(math.max(0.8, 3.5 + jitter))
    end
end)
