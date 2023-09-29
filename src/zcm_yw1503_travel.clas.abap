CLASS zcm_yw1503_travel DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message .
    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    constants:
      begin of test_message,
        msgid type symsgid value 'ZYW1503_travel',
        msgno type symsgno value '001',
        attr1 type scx_attrname value 'TRAVEL',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
      end of TEST_MESSAGE.

      constants:
      begin of travel_cancelled_successfully,
        msgid type symsgid value 'ZYW1503_travel',
        msgno type symsgno value '002',
        attr1 type scx_attrname value 'TRAVEL',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
      end of TRAVEL_CANCELLED_SUCCESSFULLY.


      constants:
      begin of travel_already_cancelled,
        msgid type symsgid value 'ZYW1503_travel',
        msgno type symsgno value '003',
        attr1 type scx_attrname value 'TRAVEL',
        attr2 type scx_attrname value '',
        attr3 type scx_attrname value '',
        attr4 type scx_attrname value '',
      end of TRAVEL_ALREADY_CANCELLED.

    types ty_user_name type c LENGTH 12.

    METHODS constructor
      IMPORTING
        i_textid   LIKE if_t100_message=>t100key OPTIONAL
        i_previous LIKE previous OPTIONAL
        i_severity TYPE if_abap_behv_message=>t_severity
        i_user_name TYPE ty_user_name OPTIONAL
        i_travel type /DMO/Description OPTIONAL.

    data user_name TYPE ty_user_name.
    DATA travel type /dmo/description .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcm_yw1503_travel IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).


    if_t100_message~t100key =  i_textid.
    if_abap_behv_message~m_severity = i_severity.
    user_name = i_user_name.
    travel = i_travel.

    ENDMETHOD.


ENDCLASS.
