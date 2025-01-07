require 'rspec'
require './lib/race'
require './lib/candidate'

describe Race do
    before do
        @race = Race.new("Texas Governor")
    end

    describe '#initialze' do
        it 'exists' do
            expect(@race).to be_a(Race)
        end

        it 'has an office' do
            expect(@race.office).to eq("Texas Governor")
        end

        it 'begins with no candidates' do
            expect(@race.candidates).to eq([])
        end

        it 'begins open' do
            expect(@race.open?).to eq(true)
        end
    end

    describe '#register_candidate' do
        it 'can register a candidate' do
            candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})

            expect(candidate1).to be_a(Candidate)
            expect(candidate1.name).to eq("Diana D")
            expect(candidate1.party).to eq(:democrat)
        end

        it 'can store several candidates' do
            candidate1 = @race.register_candidate({name: "Diana D", party: :democrat})
            candidate2 = @race.register_candidate({name: "Roberto R", party: :republican})

            expect(@race.candidates).to eq([candidate1, candidate2])
        end
    end
end