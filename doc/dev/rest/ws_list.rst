ws_list
=======
        **Current list of variants**

.. index:: 
    ws_list; request

Synopsis
--------

**ws_list** 

    **Arguments**: 

        **ds**: dataset name
        
        **filter**: *optional* name of applying filter
        
        **conditions**: *optional* list of applying 
            :doc:`condition descriptors<s_condition>`
            *in JSON string representation*

        **zone**: *optional* :
        
        | ``[`` list of zone settings
        |       ``[``
        |             **[0]**:  zone name, *string*
        |             **[1]**:  ``[`` variants ``]``, *list of strings*
        |             **[2]**:  false, *add it if negation of condition is required*
        |        ``]``, ...
        | ``]``  *in JSON string representation*
        
    **Return value**: 
    
    | ``{`` *dictionary*
    |       "**ds**":   dataset name, *string*
    |       "**total-counts**": ``[`` *list*
    |                       **[0]**: total count of DNA variants, *int*
    |                       **[1]**: total count of transcript variants, *int* ``]``
    |                       **[2]**: total count of transcripts, *int* ``]``
    |       "**filtered-counts**": ``[`` *list*
    |                       **[0]**: filtered count of DNA variants, *int*
    |                       **[1]**: filtered count of transcript variants, *int* ``]``
    |                       **[2]**: total count of transcripts, *int* ``]``
    |       "**records**: ``[`` *list* of :doc:`s_record` ``]``
    |       "**active-samples**": active samples indexes, *string* 
    | ``}``
    
    
Description
-----------
The request is the principal one for organizing :ref:`full<full_viewing_regime>` variant of :doc:`../concepts/view`.

The request affects only :term:`workspaces<workspace>` and return list of :term:variant` record descriptors.

If arguments **filter**, **conditions**, **zone** are not set, result of request is the complete list of records in dataset returns. Otherwise result is restricted by :term:`filter` and/or condition on :term:`zones<zone>`.

In **zone** list conditions can be present in positive or negative variants. For negation of condition just add **false** to the end of instruction. 

To define :term:`filter` use either **filter** or **conditions**. See details :ref:`here<fiter_conditions>`.

Some samples can be :ref:`active<active_samples>` in context of current filter, and this information forms property **active-samples** of descriptor. The string has form of list of integers separated by ','  and can be used as argument of :doc:`reccnt` call.

Comment
-------
The request format supports applying of multiple zones, butthe current user interface allows to set only one zone at time. Extension of the user interface is expected in future development.

See also
--------
:doc:`ds_list`

:doc:`../concepts/ws_pg`

