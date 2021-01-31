




















enum BallotInfo{
  Participants
  Title
}

enum Category {
  Profile
  VotingTime
  LastDate
  Ballotinfo
}


type Voter {
  voterid: int!
  name: string!
  age: int
  gender: string
  address: string
  nationality: string
}
