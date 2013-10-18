# -*- coding: utf-8 -*-
require 'spec_helper'

describe City do

  it 'should create a city' do
    -> { City.make! }.should_not raise_error
  end

  describe 'instance' do

    let(:city) { City.make! }

    describe 'Relatives' do
      let(:nation) { Nation.make! }

      it 'should belongs to nation' do
        city.nation = nation
        city.save.should be_true
      end

      it 'should belongs to region' do
        city.nation = nation
        city.save.should be_true
      end

    end

  end

  describe 'geoenabled' do
    before do
      City.create_indexes
    end

    it 'should find closest one' do
      city = City.make!
      City.nearby(city.geom).first.should eql(city)
    end

  end

  describe 'validations' do

    it 'should have a slug' do
      city = City.new(name: '')

      city.save
      city.should_not be_valid
      city.should have(1).errors_on(:slug)
    end

  end

end

#   it { should have_indices :name, :geom, :area, [:region_id, :nation_id] }

#   it 'should accept an area' do
#     @city = City.make(:area =>  Polygon.from_coordinates([
#     [[0,0],[4,0],[4,4],[0,4],[0,0]],[[1,1],[3,1],[3,3],[1,3],[1,1]]]))
#     @city.area.should be_instance_of(Polygon)
#   end

#   describe 'some helpers' do
#     it 'should have some nice x y z' do
#       @city = City.make
#       @city.should respond_to(:x,:y,:z)
#     end
#   end

#   describe 'Find by proximity' do

#     def pt(x,y);      Point.from_x_y(x,y); end

#     before(:each) do
#       @perto = City.make!(:geom => pt(10,10))
#       @medio = City.make!(:geom => pt(20,20))
#       @longe = City.make!(:geom => pt(30,30))
#       @ponto = pt(12,12)
#     end

#     it 'should find the closest city' do
#       @city = City.close_to(@ponto).first
#       @city.should eql(@perto)
#     end

#     it 'should find the closest city to make sure' do
#       ponto = pt(22,22)
#       @city = City.close_to(ponto).first
#       @city.should eql(@medio)
#     end

#     it 'should find the closest' do
#       @poi = City.close_to(@ponto).first(2)
#       @poi.should eql([@perto,@medio])
#     end
#   end
