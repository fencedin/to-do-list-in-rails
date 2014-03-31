require 'spec_helper'

describe Task do
  it { should validate_presence_of :description }
  it { should ensure_length_of(:description).is_at_most(50) }
end
