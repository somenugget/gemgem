class Comment::Create < Trailblazer::Operation
  class Present < Trailblazer::Operation
    step Model(Comment, :new)
    step :assign_thing_id!
    step Contract::Build(constant: Comment::Contract::Create)

    def assign_thing_id!(options, *)
      options[:model].thing_id = options[:params][:comment][:thing_id]
    end
  end

  step Nested(Present)
  step Contract::Validate(key: :comment)
  step Contract::Persist()
end
