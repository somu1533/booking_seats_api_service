

require 'rails_helper'

describe SeatsController do
    describe '#update the booking status' do
        let(:venue) { create :venue }
        subject { patch :update, params: { id: venue.name, seat_id: "a4", seat: {status: "NOT AVAILABLE"} } }

        it 'should return success response' do
            subject
            parsed_body = JSON.parse(response.body)
            #pp parsed_body
            expect(response).to have_http_status(:ok)
            expect(parsed_body["status"]).to eq("NOT AVAILABLE")
            expect(parsed_body["seat_id"]).to eq("a4")
        end

        # it 'validation the output after booking a4 seats a5, a6, a1' do
        #     get :show, params: { id: venue.name }
        #     parsed_body = JSON.parse(response.body)
        #     pp parsed_body
        #     expect(parsed_body["seats"]).to eq({
        #         "a5"=> {
        #             "id"=> "a4",
        #             "row"=> "a",
        #             "column"=> 4,
        #             "status"=> "AVAILABLE"
        #         },
        #         "a6"=> {
        #             "id"=> "a5",
        #             "row"=> "a",
        #             "column"=> 5,
        #             "status"=> "AVAILABLE"
        #         },
        #         "a1"=> {
        #             "id"=> "a6",
        #             "row"=> "a",
        #             "column"=> 6,
        #             "status"=> "AVAILABLE"
        #         }
        #     })
        # end
    end
end