class Thing::Index < Trailblazer::Operation
  step :all!

  def all!(options, *)
    options[:models] = Thing.all
  end
end
