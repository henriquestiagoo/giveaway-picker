import ArgumentParser
import Foundation
import Supabase

@main
struct giveawaypicker: AsyncParsableCommand {
    @Option(name: .shortAndLong, help: "The supabase reference identifier.") // --id or -i
    var id: String

    @Option(name: .shortAndLong, help: "The supabase admin key.") // --key or -k
    var key: String

    @Option(name: .shortAndLong, help: "The number of winners of the giveaway.") // --winners or -w
    var winners: Int = 3

    mutating func run() async throws {
        print("#############################################################")
        print("## 🏖️  Starting iOS Coffee Break Newsletter August Giveaway ...")

        guard let url = URL(string: "https://\(id).supabase.co") else { throw Error.invalidUrl }

        let supabaseClient = SupabaseClient(
            supabaseURL: url,
            supabaseKey: key
        )

        let subscribers: [Subscriber] = try await supabaseClient
            .from("subscribers")
            .select()
            .execute()
            .value

        print("\nThe \(winners) winners are: ")
        let winners = subscribers.shuffled().prefix(winners)
        for winner in winners {
            print("* \(winner.email)")
        }
        print("\n## 🎉 Congratulations to all!")
        print("#############################################################")
    }
}
