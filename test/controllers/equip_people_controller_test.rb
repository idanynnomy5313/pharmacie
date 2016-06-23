require 'test_helper'

class EquipPeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equip_person = equip_people(:one)
  end

  test "should get index" do
    get equip_people_url
    assert_response :success
  end

  test "should get new" do
    get new_equip_person_url
    assert_response :success
  end

  test "should create equip_person" do
    assert_difference('EquipPerson.count') do
      post equip_people_url, params: { equip_person: { description: @equip_person.description, id_attachment: @equip_person.id_attachment, name: @equip_person.name } }
    end

    assert_redirected_to equip_person_path(EquipPerson.last)
  end

  test "should show equip_person" do
    get equip_person_url(@equip_person)
    assert_response :success
  end

  test "should get edit" do
    get edit_equip_person_url(@equip_person)
    assert_response :success
  end

  test "should update equip_person" do
    patch equip_person_url(@equip_person), params: { equip_person: { description: @equip_person.description, id_attachment: @equip_person.id_attachment, name: @equip_person.name } }
    assert_redirected_to equip_person_path(@equip_person)
  end

  test "should destroy equip_person" do
    assert_difference('EquipPerson.count', -1) do
      delete equip_person_url(@equip_person)
    end

    assert_redirected_to equip_people_path
  end
end
