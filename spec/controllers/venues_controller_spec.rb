require 'rails_helper'

describe VenuesController do
    describe '#create valid attributes' do
        let!(:valid_attributes) {
            { venue: {name: "venue2", layout_row: 10, layout_column: 10 } }
        }
        subject { post :create, params: valid_attributes }

        it 'should return success response and validate the json' do
            subject
            parsed_body = JSON.parse(response.body)
            expect(response).to have_http_status(:created)
            expect(parsed_body["name"]).to eq(valid_attributes[:venue][:name])
            expect(parsed_body["layout_row"]).to eq(valid_attributes[:venue][:layout_row])
            expect(parsed_body["layout_column"]).to eq(valid_attributes[:venue][:layout_column])
        end
    end

    describe '#create invalid attributes' do 
        let!(:invalid_attributes) {
            { venue: {layout_row: 10, layout_column: 10 } }
        }
        subject { post :create, params: invalid_attributes }

        it 'should return error for invalid attributes' do
            subject
            parsed_body = JSON.parse(response.body)
            expect(response).to have_http_status(:unprocessable_entity)
            expect(parsed_body["name"]).to eq(["can't be blank"])
        end
    end

    describe '#show' do
        let(:venue) { create :venue }
        subject { get :show, params: { id: venue.name } }

        it 'should return success response' do
            subject
            expect(response).to have_http_status(:ok)
        end

        it 'validation the output get the closest 3 seats a3, a4, a5' do
            subject
            parsed_body = JSON.parse(response.body)
            expect(parsed_body["seats"]).to eq({
                "a4"=> {
                    "id"=> "a4",
                    "row"=> "a",
                    "column"=> 4,
                    "status"=> "AVAILABLE"
                },
                "a5"=> {
                    "id"=> "a5",
                    "row"=> "a",
                    "column"=> 5,
                    "status"=> "AVAILABLE"
                },
                "a6"=> {
                    "id"=> "a6",
                    "row"=> "a",
                    "column"=> 6,
                    "status"=> "AVAILABLE"
                }
            })
        end
    end
end