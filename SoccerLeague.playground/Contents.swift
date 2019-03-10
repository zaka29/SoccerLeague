//: Playground - noun: a place where people can play

/**
** Initial data: teams, practice game dates, collection of the players
**/
let teams = ["Dragons", "Sharks", "Raptors"]
let gameDates  = ["Dragons": "March 17, 1pm", "Sharks": "March 17, 3pm", "Raptors": "March 18, 1pm"]
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
**  Function: Split players into experienced and beginner groups collections;
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

/**
**  Slice given group of players into the teams with equal number of players per each team based on given number of teams
**/
func dividePlayersIntoTeams(_ players: [[String: String]], _ teams: [String]) -> [[[String: String]]] {
    let range = players.count / teams.count
    var teamContainer = [[[String: String]]]()
    for counterMark in stride(from: 0, to: players.count, by: range) {
        let team = Array(players[counterMark..<counterMark + range])
        teamContainer.append(team)
    }
    return teamContainer;
}

var experiencedTeam = dividePlayersIntoTeams(playersGroups.experienced, teams)
var beginnerTeam = dividePlayersIntoTeams(playersGroups.inExperienced, teams)

/**
**  Finally combine the beginner players with evenly allocated experienced players
**  strore data in array of dictionaries - players nested in the teams ductionaries
**/
func makeTheTeams(teamsNumber teams : Int, teamBeginners beginners : [[[String: String]]], teamExperienced experienced : [[[String: String]]]) -> [[[String: String]]] {
    var teamCopy = beginners
    
    for teamIndex in 0..<teams {
        teamCopy[teamIndex].append(contentsOf: experienced[teamIndex])
    }
   
    return teamCopy
}

var soccerTeamsCombined = makeTheTeams(teamsNumber: teams.count, teamBeginners: beginnerTeam, teamExperienced: experiencedTeam)
var soccerTeamsDivided = [String: [[[String: String]]] ]()

// generate the team dictionary containers based on given number of teams
for i in 0..<teams.count {
    soccerTeamsDivided[teams[i]] = []
}

// populates the teams dictionary containers
for teamIndex in teams.indices {
    soccerTeamsDivided[teams[teamIndex]]?.append(soccerTeamsCombined[teamIndex])
}

// define letters collection
var letters = [String]()

/**
**  Format nice invitation letter
**/
func composeLetter(_ team: String, _ playerName: String, _ guardianName: String, _ practiceDate: String) -> String {
    return """
        Dear \(guardianName),
    
        We are excited to inform you that \(playerName) will represnt the colours of the \(team)
        and the teams practices start on \(practiceDate)
    
        School Sports Committee
    """
}

// Generate invitation letters
for (key, _) in soccerTeamsDivided {
    for players in soccerTeamsDivided[key]! {
        for player in players {
            let letter = composeLetter(key, player["name"]!, player["guardianName"]!, gameDates[key]!)
            letters.append(letter)
        }
    }
}

for letter in letters {
    print("    --------------------")
    print(letter)
}
