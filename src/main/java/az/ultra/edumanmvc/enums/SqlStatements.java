package az.ultra.edumanmvc.enums;

import lombok.Getter;

@Getter
public enum SqlStatements {


    GET_ALL_PERSONS("SELECT * FROM EDUMAN_COMMON.COM_PERSONS"),
    FIND_BY_ID("SELECT ID, NAME, SURNAME, MIDDLE_NAME FROM EDUMAN_COMMON.COM_PERSONS WHERE id = ?"),
    GET_PERSON_DETAILS("SELECT * FROM TABLE(EDUMAN_COMMON.get_person_data())"),
    GET_COMMON_PERSONS("SELECT ID, NAME, SURNAME, MIDDLE_NAME FROM TABLE(EDUMAN_COMMON.test_t())"),
    UPDATE_PERSON("UPDATE EDUMAN_COMMON.COM_PERSONS SET NAME = ?, SURNAME = ?, MIDDLE_NAME = ? WHERE ID = ?");

    private final String query;

    SqlStatements(String query) {
        this.query = query;
    }
}