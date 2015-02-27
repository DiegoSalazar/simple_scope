require "simple_scope/version"

module SimpleScope
  # define a simple scope where the conditions are derived from the scope name
  # e.g. scope :color_red # => where('color' => 'red')
  #      scope :name_bob_and_role_admin # => where('name' => 'bob', 'role' => 'admin')
  def scope(*args)
    return super if args.size > 1
    
    pairs = args.first.to_s.split '_and_'
    conditions = Hash[pairs.map { |p| p.split('_') }]

    super args.first, -> { where conditions }
  end
end

ActiveRecord::Base.extend SimpleScope
