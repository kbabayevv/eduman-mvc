package az.ultra.edumanmvc.enums;

import lombok.Getter;

@Getter
public enum SqlStatements {


    GET_ALL_PERSONS("SELECT * FROM EDUMAN_COMMON.COM_PERSONS"),
    FIND_BY_ID("SELECT ID, NAME, SURNAME, MIDDLE_NAME FROM EDUMAN_COMMON.COM_PERSONS WHERE id = ?"),
    GET_PERSON_DETAILS("SELECT * FROM TABLE(EDUMAN_COMMON.get_person_data())"),

    //update logic created
    GET_COMMON_PERSONS("SELECT ID, NAME, SURNAME, MIDDLE_NAME FROM TABLE(EDUMAN_COMMON.test_t())"),
    UPDATE_PERSON("UPDATE EDUMAN_COMMON.COM_PERSONS SET NAME = ?, SURNAME = ?, MIDDLE_NAME = ? WHERE ID = ?"),

    //custom table
    INSERT_USER("INSERT INTO EDUMAN_COMMON.TEST_KAMRAN (NAME, SURNAME, MIDDLE_NAME)" +
            "VALUES (?, ?, ?)"),
    FIND_USER_BY_ID("SELECT ID, NAME, SURNAME, MIDDLE_NAME FROM EDUMAN_COMMON.TEST_KAMRAN WHERE id = ?"),
    GET_COMMON_USERS("SELECT ID, NAME, SURNAME, MIDDLE_NAME FROM EDUMAN_COMMON.TEST_KAMRAN"),
    UPDATE_USER("UPDATE EDUMAN_COMMON.TEST_KAMRAN SET NAME = ?, SURNAME = ?, MIDDLE_NAME = ? WHERE ID = ?"),
    DELETE_USER("DELETE FROM EDUMAN_COMMON.TEST_KAMRAN WHERE ID = ?"),

    //combo
    SELECT_ONLY_STUDENTS("SELECT tk.ID, tk.NAME, tk.SURNAME, tk.MIDDLE_NAME FROM EDUMAN_COMMON.TEST_KAMRAN2 tk INNER JOIN EDUMAN_MANAGEMENT.MAN_STUDENTS mk ON tk.ID = mk.COM_PERSON_ID"),
    SEARCH_BY_NAME_FOR_STUDENTS("SELECT tk.ID, tk.NAME, tk.SURNAME, tk.MIDDLE_NAME FROM EDUMAN_COMMON.TEST_KAMRAN2 tk INNER JOIN EDUMAN_MANAGEMENT.MAN_STUDENTS mk ON tk.ID = mk.COM_PERSON_ID WHERE UPPER(tk.NAME) LIKE ?"),
    SEARCH_BY_NAME_ALL_USERS("SELECT ID, NAME, SURNAME, MIDDLE_NAME FROM EDUMAN_COMMON.TEST_KAMRAN2 WHERE UPPER(NAME) LIKE ?"),;

    private final String query;

    SqlStatements(String query) {
        this.query = query;
    }
}