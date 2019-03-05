//: Playground - noun: a place where people can play

// Define players teams:
var teamSharks = [[String: String]]()
var teamDragons = [[String: String]]()
var teamRaptors = [[String: String]]()
let teams = [teamSharks, teamDragons, teamRaptors]

// Define players collection
let players: [[String: String]] = [
    ["name" : "Joe Smith", "Height" : "42", "experience" : "yes", "guardianName" : "Jim and Jan Smith"],
    ["name" : "Jill Tanner", "Height" : "36", "experience" : "yes", "guardianName" : "Clara Tanner"],
    ["name" : "Bill Bon", "Height" : "43", "experience" : "yes", "guardianName" : "Sara and Jenny Bon"],
    ["name" : "Eva Gordon", "Height" : "45", "experience" : "no", "guardianName" : "Wendy and Mike Gordon"],
    ["name" : "Matt Gill", "Height" : "40", "experience" : "no", "guardianName" : "Charles and Sylvia Gill"],
    ["name" : "Kimmy Stein", "Height" : "41", "experience" : "no", "guardianName" : "Bill and Hillary Stein"],
    ["name" : "Sammy Adams", "Height" : "45", "experience" : "no", "guardianName" : "Jeff Adams"],
    ["name" : "Karl Saygan", "Height" : "42", "experience" : "yes", "guardianName" : "Heather Bledsoe"],
    ["name" : "Suzane Greenberg", "Height" : "44", "experience" : "yes", "guardianName" : "Henrietta Dumas"],
    ["name" : "Suzane Greenberg", "Height" : "41", "experience" : "no", "guardianName" : "Gala Dali"],
    ["name" : "Joe Kavalier", "Height" : "39", "experience" : "no", "guardianName" : "Sam and Elaine Kavalier"],
    ["name" : "Ben Finkelstein", "Height" : "44", "experience" : "no", "guardianName" : "Aaron and Jill Finkelstein"],
    ["name" : "Diego Soto", "Height" : "41", "experience" : "yes", "guardianName" : "Robin and Sarika Soto"],
    ["name" : "Chloe Alaska", "Height" : "47", "experience" : "no", "guardianName" : "David and Jamie Alaska"],
    ["name" : "Arnold Willis", "Height" : "43", "experience" : "no", "guardianName" : "Claire Willis"],
    ["name" : "Phillip Helm", "Height" : "44", "experience" : "yes", "guardianName" : "Thomas Helm and Eva Jones"],
    ["name" : "Les Clay", "Height" : "42", "experience" : "yes", "guardianName" : "Wynonna Brown"],
    ["name" : "Herschel Krustofski", "Height" : "45", "experience" : "yes", "guardianName" : "Hyman and Rachel Krustofski"],
]

/**
** Split players into experienced and unexperienced team groups
**
**/
func extractExperiencedPlayers(allPlayers players: [[String: String]]) -> (experienced: [[String: String]], inExperienced: [[String: String]] ) {
    
    var experiencedPlayers = [[String: String]]()
    var inExperiencedPlayers = [[String: String]]()
    
    for player in players {
        if player["experience"] == "yes" {
            experiencedPlayers.append(player)
        } else if player["experience"] == "no" {
            inExperiencedPlayers.append(player)
        }
    }
    
    return (experiencedPlayers, inExperiencedPlayers)
}

// Create the groups;
let playersGroups = extractExperiencedPlayers(allPlayers: players)

// Easy to read debugg
print("Number of exp. players - \(playersGroups.experienced.count)")
for player in playersGroups.experienced {
    let index = playersGroups.experienced.firstIndex(of: player)
    
    print("\(index!) Player Name --- \(player["name"]!)")
}

func assignToTeams(_ players: [[String: String]], _ teams: [[[String : String]]]) -> [[[String: String]]] {
    let range = players.count / teams.count
    var playerTeamsNew = [[[String: String]]]()
    for counterMark in stride(from: 0, to: players.count, by: range) {
        let teamTest = Array(players[counterMark..<counterMark + range])
        playerTeamsNew.append(teamTest)
    }
    return playerTeamsNew;
}

var experiencedTeam = assignToTeams(playersGroups.experienced, teams)
var beginnerTeam = assignToTeams(playersGroups.inExperienced, teams)

for index in experiencedTeam.indices {
    print("team \(index):")

    for player in experiencedTeam[index] {
        print("--- \(player["name"]!)")
    }
}

print("--- ---- ---- ---")
print("--- Beginner Teams ---")

for index in beginnerTeam.indices {
    print("team \(index):")
    
    for player in beginnerTeam[index] {
        print("--- \(player["name"]!)")
    }
}

// Finally lets form the gangs
func makeTheTeams(teamsNumber teams : Int, teamBeginners beginners : [[[String: String]]], teamExperienced experienced : [[[String: String]]]) -> [[[String: String]]] {
    var teamCopy = beginners
    
    for teamIndex in 0..<teams {
        teamCopy[teamIndex].append(contentsOf: experienced[teamIndex])
    }
   
    return teamCopy
}

var theTeams = makeTheTeams(teamsNumber: teams.count, teamBeginners: beginnerTeam, teamExperienced: experiencedTeam)

print("--- ---- ---- ---")
print("--- All teams ---")

for index in theTeams.indices {
    print("team \(index):")
    
    for player in theTeams[index] {
        print("--- \(player["name"]!)")
    }
}

//let teamDragons
var teamNames = ["Dragons", "Sahrsk", "Raptors"]
var dummyTeams = [String: [[String: Any]] ]()

for i in 0..<teamNames.count {
    dummyTeams[teamNames[i]] = []
}

//teams[teamNames[index]]?.append(tallestPlayer[0])

print(dummyTeams)

