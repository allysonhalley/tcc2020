json.extract! card_request, :id, :military_registration, :document_reference, :reason_request, :created_at, :updated_at
json.url card_request_url(card_request, format: :json)
